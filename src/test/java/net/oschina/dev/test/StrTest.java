/**
* Project Name:dev-tp
* Date:2016年8月5日
* Copyright (c) 2016, jingma All Rights Reserved.
*/

package net.oschina.dev.test;

import org.junit.Test;

/**
 * 字符串测试 <br/>
 * date: 2016年8月5日 <br/>
 * @author jingma
 * @version 
 */
public class StrTest {
    @Test
    public void splitTest(){
        System.out.println("dsad-232".split("-").length);
        System.out.println("dsad-".split("-").length);
        System.out.println("dsad".split("-").length);
    }
}
