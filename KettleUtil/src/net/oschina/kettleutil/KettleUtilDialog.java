package net.oschina.kettleutil;

import net.oschina.mytuils.StringUtil;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.ModifyEvent;
import org.eclipse.swt.events.ModifyListener;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.events.ShellAdapter;
import org.eclipse.swt.events.ShellEvent;
import org.eclipse.swt.layout.FormAttachment;
import org.eclipse.swt.layout.FormData;
import org.eclipse.swt.layout.FormLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.MessageBox;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;
import org.pentaho.di.core.Const;
import org.pentaho.di.core.Props;
import org.pentaho.di.i18n.BaseMessages;
import org.pentaho.di.trans.TransMeta;
import org.pentaho.di.trans.step.BaseStepMeta;
import org.pentaho.di.trans.step.StepDialogInterface;
import org.pentaho.di.ui.core.widget.StyledTextComp;
import org.pentaho.di.ui.core.widget.TextVar;
import org.pentaho.di.ui.trans.step.BaseStepDialog;

/**
* 通用工具 <br/>
* date: 2016年6月20日 <br/>
* @author jingma
* @version 
*/
public class KettleUtilDialog extends BaseStepDialog implements StepDialogInterface {

	private static Class<?> PKG = KettleUtilMeta.class; // for i18n purposes
	
	private KettleUtilMeta input;

    /**
    * 配置名称
    */
    private TextVar wClassName;
	private Label wlClassName;
	private FormData fdlClassName, fdClassName;

    /**
    * 具体配置信息
    */
    private StyledTextComp wConfigInfo;
    private Label wlConfigInfo;
    private FormData fdlConfigInfo, fdConfigInfo;
	
	public KettleUtilDialog(Shell parent, Object in, TransMeta transMeta, String sname) {
		super(parent, (BaseStepMeta) in, transMeta, sname);
		input = (KettleUtilMeta) in;
	}

	public String open() {
		Shell parent = getParent();
		Display display = parent.getDisplay();

		shell = new Shell(parent, SWT.DIALOG_TRIM | SWT.RESIZE | SWT.MIN | SWT.MAX);
		props.setLook(shell);
		setShellImage(shell, input);

		ModifyListener lsMod = new ModifyListener() {
			public void modifyText(ModifyEvent e) {
				input.setChanged();
			}
		};
		changed = input.hasChanged();

		FormLayout formLayout = new FormLayout();
		formLayout.marginWidth = Const.FORM_MARGIN;
		formLayout.marginHeight = Const.FORM_MARGIN;

		shell.setLayout(formLayout);
		shell.setText(BaseMessages.getString(PKG, "KettleUtil.Shell.Title")); 

		int middle = props.getMiddlePct();
		int margin = Const.MARGIN;

		// Stepname line
		wlStepname = new Label(shell, SWT.RIGHT);
		wlStepname.setText(BaseMessages.getString(PKG, "System.Label.StepName")); 
		props.setLook(wlStepname);
		fdlStepname = new FormData();
		fdlStepname.left = new FormAttachment(0, 0);
		fdlStepname.right = new FormAttachment(middle, -margin);
		fdlStepname.top = new FormAttachment(0, margin);
		wlStepname.setLayoutData(fdlStepname);
		
		wStepname = new Text(shell, SWT.SINGLE | SWT.LEFT | SWT.BORDER);
		wStepname.setText(stepname);
		props.setLook(wStepname);
		wStepname.addModifyListener(lsMod);
		fdStepname = new FormData();
		fdStepname.left = new FormAttachment(middle, 0);
		fdStepname.top = new FormAttachment(0, margin);
		fdStepname.right = new FormAttachment(100, 0);
		wStepname.setLayoutData(fdStepname);

		wlClassName = new Label(shell, SWT.RIGHT);
		wlClassName.setText(BaseMessages.getString(PKG, "KettleUtil.ClassName.Label")+" "); 
		props.setLook(wlClassName);
		fdlClassName = new FormData();
		fdlClassName.left = new FormAttachment(0, 0);
		fdlClassName.right = new FormAttachment(middle, -margin);
		fdlClassName.top = new FormAttachment(wStepname, margin);
		wlClassName.setLayoutData(fdlClassName);

		wClassName = new TextVar(transMeta, shell, SWT.SINGLE | SWT.LEFT | SWT.BORDER);
		props.setLook(wClassName);
		wClassName.addModifyListener(lsMod);
		fdClassName = new FormData();
		fdClassName.left = new FormAttachment(middle, 0);
		fdClassName.top = new FormAttachment(wStepname, margin);
        fdClassName.right = new FormAttachment(100, margin );
		wClassName.setLayoutData(fdClassName);

	    wlConfigInfo = new Label( shell, SWT.NONE );
	    wlConfigInfo.setText( BaseMessages.getString( PKG, "KettleUtil.ConfigInfo.Label" )+" " );
	    props.setLook( wlConfigInfo );
	    fdlConfigInfo = new FormData();
	    fdlConfigInfo.left = new FormAttachment( 0, 0 );
	    fdlConfigInfo.top = new FormAttachment( wClassName, margin );
	    fdlConfigInfo.right = new FormAttachment( middle, -margin );
	    wlConfigInfo.setLayoutData( fdlConfigInfo );

        // OK and cancel buttons
        wOK = new Button(shell, SWT.PUSH);
        wOK.setText(BaseMessages.getString(PKG, "System.Button.OK")); 

        wGet = new Button(shell, SWT.PUSH);
        wGet.setText("获取默认配置");
        wGet.setToolTipText("在输入类名称后再通过此按钮获取对应默认配置信息");

        // Script line
        wlConfigInfo = new Label( shell, SWT.NONE );
        wlConfigInfo.setText( BaseMessages.getString( PKG, "JobEntryKettleUtil.Script.Label" ) );
        props.setLook( wlConfigInfo );
        fdlConfigInfo = new FormData();
        fdlConfigInfo.left = new FormAttachment( 0, 0 );
        fdlConfigInfo.top = new FormAttachment( wClassName, margin );
        wlConfigInfo.setLayoutData( fdlConfigInfo );
        wConfigInfo =
          new StyledTextComp( transMeta, shell, SWT.MULTI | SWT.LEFT | SWT.BORDER | SWT.H_SCROLL | SWT.V_SCROLL, "" );
        wConfigInfo.setText( BaseMessages.getString( PKG, "JobEntryKettleUtil.Script.Default" ) );
        props.setLook( wConfigInfo, Props.WIDGET_STYLE_FIXED );
        wConfigInfo.addModifyListener( lsMod );
        fdConfigInfo = new FormData();
        fdConfigInfo.left = new FormAttachment( 0, 0 );
        fdConfigInfo.top = new FormAttachment( wlConfigInfo, margin );
        fdConfigInfo.right = new FormAttachment( 100, -10 );
        fdConfigInfo.bottom = new FormAttachment( wOK, -margin );
        wConfigInfo.setLayoutData( fdConfigInfo );
		      
		wCancel = new Button(shell, SWT.PUSH);
		wCancel.setText(BaseMessages.getString(PKG, "System.Button.Cancel")); 

		BaseStepDialog.positionBottomButtons(shell, new Button[] {wOK, wCancel,wGet}, margin, null);

		
		// Add listeners
		lsCancel = new Listener() {
			public void handleEvent(Event e) {
				cancel();
			}
		};
		lsOK = new Listener() {
			public void handleEvent(Event e) {
				ok();
			}
		};
		lsGet = new Listener() {
            @Override
            public void handleEvent(Event e) {
                input.setClassName(wClassName.getText());
                input.setConfigInfo(wConfigInfo.getText());
                String conf = null;
                String msg = "获取默认配置失败，请输入正确的类名称";
                try {
                    conf = input.getDefaultConfigInfo(transMeta,
                            wStepname.getText(),variables);
                } catch (Exception e1) {
                    msg = e1.getMessage();
                }
                if(StringUtil.isBlank(conf)){
                    wConfigInfo.setText("{}");
                    MessageBox mb = new MessageBox( shell, SWT.OK | SWT.ICON_ERROR );
                    mb.setMessage(msg);
                    mb.setText("错误");
                    mb.open();
                }else{
                    wConfigInfo.setText(conf);
                }
            }
        };

		wCancel.addListener(SWT.Selection, lsCancel);
		wOK.addListener(SWT.Selection, lsOK);
		wGet.addListener(SWT.Selection, lsGet);

		lsDef = new SelectionAdapter() {
			public void widgetDefaultSelected(SelectionEvent e) {
				ok();
			}
		};

		wStepname.addSelectionListener(lsDef);
		wClassName.addSelectionListener(lsDef);

		// Detect X or ALT-F4 or something that kills this window...
		shell.addShellListener(new ShellAdapter() {
			public void shellClosed(ShellEvent e) {
				cancel();
			}
		});

		
		// Set the shell size, based upon previous time...
		setSize();

		getData();
		input.setChanged(changed);

		shell.open();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch())
				display.sleep();
		}
		return stepname;
	}
	
	// Read data and place it in the dialog
	public void getData() {
		wStepname.selectAll();
		wClassName.setText(input.getClassName());	
        wConfigInfo.setText(input.getConfigInfo()); 
	}

	private void cancel() {
		stepname = null;
		input.setChanged(changed);
		dispose();
	}
	
	// let the plugin know about the entered data
	private void ok() {
		stepname = wStepname.getText(); // return value
		input.setClassName(wClassName.getText());
        input.setConfigInfo(wConfigInfo.getText());
		dispose();
	}
}
