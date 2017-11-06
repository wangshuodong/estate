package com.wangsd.core.mybatis;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class MabatisGenerator {

	public static void main(String[] args) throws Exception {
		List<String> warnings = new ArrayList<String>();
	    boolean overwrite = true;
	    File configFile = new File(MabatisGenerator.class.getClassLoader().getResource("mabatis_generator.xml").toURI());
	    ConfigurationParser cp = new ConfigurationParser(warnings);
	    Configuration config = cp.parseConfiguration(configFile);
	    DefaultShellCallback callback = new DefaultShellCallback(overwrite);
	    MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
	    myBatisGenerator.generate(null);
		System.out.println("完成"); 
	}

}
