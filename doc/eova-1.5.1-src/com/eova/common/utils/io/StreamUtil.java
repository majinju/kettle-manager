package com.eova.common.utils.io;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;

/**
 * Optimized byte and character stream utilities.
 */
public class StreamUtil {

	public static int ioBufferSize = 16384;

	// ---------------------------------------------------------------- silent close

	/**
	 * Closes an input stream and releases any system resources associated with
	 * this stream. No exception will be thrown if an I/O error occurs.
	 */
	public static void close(InputStream in) {
		if (in != null) {
			try {
				in.close();
			} catch (IOException ioex) {
				// ignore
			}
		}
	}

	/**
	 * Closes an output stream and releases any system resources associated with
	 * this stream. No exception will be thrown if an I/O error occurs.
	 */
	public static void close(OutputStream out) {
		if (out != null) {
			try {
				out.flush();
			} catch (IOException ioex) {
				// ignore
			}
			try {
				out.close();
			} catch (IOException ioex) {
				// ignore
			}
		}
	}

	/**
	 * Closes a character-input stream and releases any system resources
	 * associated with this stream. No exception will be thrown if an I/O error
	 * occurs.
	 */
	public static void close(Reader in) {
		if (in != null) {
			try {
				in.close();
			} catch (IOException ioex) {
				// ignore
			}
		}
	}

	/**
	 * Closes a character-output stream and releases any system resources
	 * associated with this stream. No exception will be thrown if an I/O error
	 * occurs.
	 */
	public static void close(Writer out) {
		if (out != null) {
			try {
				out.flush();
			} catch (IOException ioex) {
				// ignore
			}
			try {
				out.close();
			} catch (IOException ioex) {
				// ignore
			}
		}
	}

	/**
	 * Copies input stream to output stream using buffer. Streams don't have to be wrapped to buffered, since copying is already optimized.
	 */
	public static int copy(InputStream input, OutputStream output) throws IOException {
		byte[] buffer = new byte[ioBufferSize];
		int count = 0;
		int read;
		while (true) {
			System.out.println(input);
			System.out.println(buffer);
			if (input == null) {
				break;
			}
			read = input.read(buffer, 0, ioBufferSize);
			if (read == -1) {
				break;
			}
			output.write(buffer, 0, read);
			count += read;
		}
		return count;
	}

}
