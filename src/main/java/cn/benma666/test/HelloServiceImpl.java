/**
* Project Name:myservice
* Date:2019年6月18日
* Copyright (c) 2019, jingma All Rights Reserved.
*/

package cn.benma666.test;

/**
 *  <br/>
 * date: 2019年6月18日 <br/>
 * @author jingma
 * @version 
 */
public class HelloServiceImpl implements HelloService{

    /**
    * 
    * @see cn.benma666.test.HelloService#sayHello(java.lang.String)
    */
    @Override
    public String sayHello(String info) {
        return "sayHello:"+info;
    }

}
