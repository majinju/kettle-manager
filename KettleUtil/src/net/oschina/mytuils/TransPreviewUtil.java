/*! ******************************************************************************
 *
 * Pentaho Data Integration
 *
 * Copyright (C) 2002-2013 by Pentaho : http://www.pentaho.com
 *
 *******************************************************************************
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 ******************************************************************************/

package net.oschina.mytuils;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.pentaho.di.core.Const;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.core.exception.KettleValueException;
import org.pentaho.di.core.logging.KettleLogStore;
import org.pentaho.di.core.row.RowMetaInterface;
import org.pentaho.di.core.row.ValueMetaInterface;
import org.pentaho.di.trans.Trans;
import org.pentaho.di.trans.TransMeta;
import org.pentaho.di.trans.debug.BreakPointListener;
import org.pentaho.di.trans.debug.StepDebugMeta;
import org.pentaho.di.trans.debug.TransDebugMeta;
import org.pentaho.di.trans.step.StepMeta;

/**
 * Takes care of displaying a dialog that will handle the wait while previewing a transformation...
 *
 * @author Matt
 * @since 13-jan-2006
 */
public class TransPreviewUtil {
  public static final int MAX_BINARY_STRING_PREVIEW_SIZE = 1000000;
  private static Log log = LogFactory.getLog(TransPreviewUtil.class);
  private TransMeta transMeta;
  private String[] previewStepNames;
  private int[] previewSize;
  private Trans trans;

  private boolean cancelled;
  private String loggingText;
  private TransDebugMeta transDebugMeta;

  /**
   * Creates a new dialog that will handle the wait while previewing a transformation...
   */
  public TransPreviewUtil( TransMeta transMeta, String[] previewStepNames, int[] previewSize ) {
    this.transMeta = transMeta;
    this.previewStepNames = previewStepNames;
    this.previewSize = previewSize;

    cancelled = false;
  }

  public void doPreview() {
    // This transformation is ready to run in preview!
    trans = new Trans( transMeta );

    // Prepare the execution...
    //
    try {
      trans.prepareExecution( null );
    } catch ( final KettleException e ) {
    	log.error("", e);
      return;
    }

    // Add the preview / debugging information...
    //
    transDebugMeta = new TransDebugMeta( transMeta );
    for ( int i = 0; i < previewStepNames.length; i++ ) {
      StepMeta stepMeta = transMeta.findStep( previewStepNames[i] );
      StepDebugMeta stepDebugMeta = new StepDebugMeta( stepMeta );
      stepDebugMeta.setReadingFirstRows( true );
      stepDebugMeta.setRowCount( previewSize[i] );
      transDebugMeta.getStepDebugMetaMap().put( stepMeta, stepDebugMeta );
    }

    // set the appropriate listeners on the transformation...
    //
    transDebugMeta.addRowListenersToTransformation( trans );

    // Fire off the step threads... start running!
    //
    try {
      trans.startThreads();
    } catch ( final KettleException e ) {
    	log.error("", e);
      // It makes no sense to continue, so just stop running...
      //
      return;
    }

    final List<String> previewComplete = new ArrayList<String>();

    while ( previewComplete.size() < previewStepNames.length
      && !trans.isFinished() ) {
      // We add a break-point that is called every time we have a step with a full preview row buffer
      // That makes it easy and fast to see if we have all the rows we need
      //
      transDebugMeta.addBreakPointListers( new BreakPointListener() {
        public void breakPointHit( TransDebugMeta transDebugMeta, StepDebugMeta stepDebugMeta,
          RowMetaInterface rowBufferMeta, List<Object[]> rowBuffer ) {
          String stepName = stepDebugMeta.getStepMeta().getName();
          previewComplete.add( stepName );
        }
      } );

      // Change the percentage...
      try {
        Thread.sleep( 500 );
      } catch ( InterruptedException e ) {
      	log.error("", e);
        // Ignore errors
      }

    }

    trans.stopAll();

    // Capture preview activity to a String:
    loggingText =
      KettleLogStore.getAppender().getBuffer( trans.getLogChannel().getLogChannelId(), true ).toString();

  }

  /**
   * @param stepname
   *          the name of the step to get the preview rows for
   * @return A list of rows as the result of the preview run.
   */
  public List<Object[]> getPreviewRows( String stepname ) {
    if ( transDebugMeta == null ) {
      return null;
    }

    for ( StepMeta stepMeta : transDebugMeta.getStepDebugMetaMap().keySet() ) {
      if ( stepMeta.getName().equals( stepname ) ) {
        StepDebugMeta stepDebugMeta = transDebugMeta.getStepDebugMetaMap().get( stepMeta );
        return stepDebugMeta.getRowBuffer();
      }
    }
    return null;
  }

  /**
   * @param stepname
   *          the name of the step to get the preview rows for
   * @return A description of the row (metadata)
   */
  public RowMetaInterface getPreviewRowsMeta( String stepname ) {
    if ( transDebugMeta == null ) {
      return null;
    }

    for ( StepMeta stepMeta : transDebugMeta.getStepDebugMetaMap().keySet() ) {
      if ( stepMeta.getName().equals( stepname ) ) {
        StepDebugMeta stepDebugMeta = transDebugMeta.getStepDebugMetaMap().get( stepMeta );
        return stepDebugMeta.getRowBufferMeta();
      }
    }
    return null;
  }

  /**
   * @return true is the preview was canceled by the user
   */
  public boolean isCancelled() {
    return cancelled;
  }

  /**
   * @return The logging text from the latest preview run
   */
  public String getLoggingText() {
    return loggingText;
  }

  /**
   *
   * @return The transformation object that executed the preview TransMeta
   */
  public Trans getTrans() {
    return trans;
  }

  /**
   * @return the transDebugMeta
   */
  public TransDebugMeta getTransDebugMeta() {
    return transDebugMeta;
  }
  

  /**
   * Copy information from the meta-data input to the dialog fields.
 * @param rowMetaInterface 
   */
  public static List<List<Object>> getData(RowMetaInterface rowMeta, List<Object[]> buffer) {
	List<List<Object>> result = new ArrayList<List<Object>>();
	List<Object> row1 = new ArrayList<Object>();
    for ( int i = 0; i < buffer.size(); i++ ) {
      row1 = new ArrayList<Object>();
      Object[] row = buffer.get( i );
      getDataForRow( rowMeta, row1, row );
      result.add(row1);
    }
    return result;
  }

  public static int getDataForRow( RowMetaInterface rowMeta, List<Object> row1, Object[] row ) {
    int nrErrors = 0;

    // Display the correct line item...
    //
    for ( int c = 0; c < rowMeta.size(); c++ ) {
      ValueMetaInterface v = rowMeta.getValueMeta( c );
      String show;
      try {
        show = v.getString( row[c] );
        if ( v.isBinary() && show != null && show.length() > MAX_BINARY_STRING_PREVIEW_SIZE ) {
          // We want to limit the size of the strings during preview to keep all SWT widgets happy.
          //
          show = show.substring( 0, MAX_BINARY_STRING_PREVIEW_SIZE );
        }
      } catch ( KettleValueException e ) {
        nrErrors++;
        if ( nrErrors < 25 ) {
          log.error( Const.getStackTracker( e ) );
        }
        show = null;
      } catch ( ArrayIndexOutOfBoundsException e ) {
        nrErrors++;
        if ( nrErrors < 25 ) {
          log.error( Const.getStackTracker( e ) );
        }
        show = null;
      }

      if ( show != null ) {
    	  row1.add(show);
      } else {
        // Set null value
    	  row1.add("<null>");
      }
    }

    return nrErrors;

  }
}
