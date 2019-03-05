---
layout: default
title:  "Deploy jar to mvn nexus repository"
date:   2018-01-02 17:34:38 +0800
categories: mvn
---

# Deploy jar to mvn nexus repository

## Add server config to settings.xml
进入.m2文件夹，更改settings.xml，添加server配置
```
    <server>
       <id>my-nexus-release-server</id>
       <username>xxxx</username>
       <password>xxxx</password>
     </server>
```
## 更改pom.xml
新增deploy仓库配置：
```
 <distributionManagement>
		<repository>
			<id>my-nexus-release-server</id>
			<name>Internal Releases</name>
			<url>http://nexus.my.co/content/repositories/releases</url>
		</repository>
		<snapshotRepository>
			<id>my-nexus-snapshots-server</id>
			<name>Internal Snapshots</name>
			<url>http://nexus.my.co/content/repositories/snapshots</url>
		</snapshotRepository>
	</distributionManagement>
```
如果要上传source包，新增：
```
<plugin>
    <artifactId>maven-source-plugin</artifactId>
    <version>3.0.1</version>
    <configuration>
        <attach>true</attach>
    </configuration>
    <executions>
        <execution>
            <phase>compile</phase>
            <goals>
                <goal>jar</goal>
            </goals>
        </execution>
    </executions>
</plugin>
```
