/**
* Project Name:kettle-manager
* Date:2017年6月5日
* Copyright (c) 2017, jingma All Rights Reserved.
*/

package com.oss;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.management.ManagementFactory;
import java.util.Scanner;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.DefaultParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Option;
import org.apache.commons.cli.Options;

import cn.benma666.myutils.StringUtil;

import com.eova.config.EovaConfig;
import com.eova.config.EovaInit;
import com.jfinal.core.JFinal;
import com.jfinal.log.Log;

/**
 * 应用主程序 <br/>
 * date: 2017年6月5日 <br/>
 * @author jingma
 * @version 
 */
public class Main {
    /**
    * 日志
    */
    static Log log = Log.getLog(Main.class); 
    
    protected static final Options OPTIONS = new Options();
    // 配置Options
    static {
        // 设置每个Option
        Option state = Option.builder("status").desc("状态").build();
        Option start = Option.builder("start").desc("启动").build();
        Option stop = Option.builder("stop").desc("停止").build();
        Option webapp = Option.builder("webapp")
                .desc("web根目录,默认：webapp").argName("webapp").hasArg().build();
        Option port = Option.builder("port")
                .desc("应用端口,默认：82").argName("port").hasArg().build();
        port.setType(Integer.class);
        Option help = Option.builder("h")
                .desc("显示帮助信息").longOpt("help").build();
        OPTIONS.addOption(webapp);
        OPTIONS.addOption(port);
        EovaInit.initConfig();
        String pidFileName = EovaConfig.props.get("pid_file");
        //配置了pid文件才支持以下参数
        if(StringUtil.isNotBlank(pidFileName)){
            OPTIONS.addOption(state);
            OPTIONS.addOption(start);
            OPTIONS.addOption(stop);
        }
        OPTIONS.addOption(help);
    }
    /**
     * Run Server
     * 
     * @param args
     */
    public static void main(String[] args) {

        String webApp = "webapp";
        int port = 82;
        try {
            // 初始化配置
            CommandLineParser parser = new DefaultParser();
            CommandLine cmd = parser.parse(OPTIONS, args, false);
            if (cmd.hasOption("webapp")) {
                webApp = cmd.getOptionValue("webapp");
            }
            if (cmd.hasOption("port")) {
                port = Integer.parseInt(cmd.getOptionValue("port"));
            }
            String pidFileName = EovaConfig.props.get("pid_file");
            //允许不配做pid文件，则不使用此种方式管理应用
            if(StringUtil.isNotBlank(pidFileName)){
                if(args.length==0){
                    printHelp();
                    return;
                }
                File pidFile = new File(pidFileName);
                if (cmd.hasOption("h")) {
                    printHelp();
                    return;
                }else  if (cmd.hasOption("status")) {
                    if(!pidFile.exists()){
                        System.out.println(pidFile.getAbsolutePath()+"文件不存在，当前应用未启动");
                    }else{
                        String pid = readPid(pidFile);
                        System.out.println("进程id："+pid);
                    }
                }else  if (cmd.hasOption("stop")) {
                    if(!pidFile.exists()){
                        System.out.println(pidFile.getAbsolutePath()+"文件不存在，当前应用未启动");
                    }else{
                        String pid = readPid(pidFile);
                        String killMl = "kill ";
                        if(System.getProperty("os.name").toLowerCase().indexOf("windows")>-1){
                            killMl += " -f "+pid;
                        }else{
                            killMl += " -9 "+pid;
                        }
                        Process p = Runtime.getRuntime().exec(killMl);
                        //读取命令错误输出流
                        Scanner sc = new Scanner(p.getErrorStream());
                        StringBuffer error = new StringBuffer();
                        while(sc.hasNext()){
                            error.append(sc.next()+" ");
                        }
                        sc.close();
                        if(StringUtil.isNotBlank(error.toString())){
                            System.err.println("进程停止失败："+pid);
                            System.err.println(error);
                        }else{
                            System.out.println("进程停止成功："+pid);
                            //读取命令输出流
                            sc = new Scanner(p.getInputStream());
                            StringBuffer out = new StringBuffer();
                            while(sc.hasNext()){
                                out.append(sc.next()+" ");
                            }
                            sc.close();
                            delPid(pidFile);
                            System.err.println(out);
                        }
                    }
                }else  if (cmd.getOptions().length==0||cmd.hasOption("start")) {
                    savePid(pidFile);
                    JFinal.start(webApp, port, "/", 0);
                }
            }else{
                JFinal.start(webApp, port, "/", 0);
            }
        } catch (Exception e) {
            log.debug("参数处理异常", e);
            System.out.println(e.getMessage());
            printHelp();
        }
    }

    /**
    * 输出帮助 <br/>
    * @author jingma
    */
    public static void printHelp() {
        HelpFormatter hf = new HelpFormatter();
        hf.printHelp("km", OPTIONS,true);
    }
    /**
    * 保存进程id <br/>
    * @author jingma
    * @param pidFile
    * @throws FileNotFoundException
    * @throws IOException
    */
    public static void savePid(File pidFile) throws FileNotFoundException,
            IOException {
        String name = ManagementFactory.getRuntimeMXBean().getName();
        FileOutputStream fo = new FileOutputStream(pidFile);
        fo.write(name.split("@")[0].getBytes());
        fo.close();
    }
    /**
    * 删除进程id文件 <br/>
    * @author jingma
    * @param pidFile
    * @throws FileNotFoundException
    * @throws IOException
    */
    public static void delPid(File pidFile){
        if(pidFile!=null&&pidFile.exists()){
            pidFile.delete();
        }
    }
    /**
    * 读取进程id <br/>
    * @author jingma
    * @param pidFile
    * @return
    * @throws FileNotFoundException
    */
    public static String readPid(File pidFile) throws FileNotFoundException {
        Scanner sc = new Scanner(pidFile);
        String pid = sc.next();
        sc.close();
        return pid;
    }
}
