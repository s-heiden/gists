# Create Tests using Randoop

If using maven, this might come in handy:

```
<!-- dieses Plugin kann alle Abhängigkeiten in ein jar-File packen indem man das goal `single` aufruft
-->
<!--
<plugin>
    <artifactId>maven-assembly-plugin</artifactId>
    <executions>
        <execution>
            <phase>package</phase>
            <goals>
                <goal>single</goal>
            </goals>
        </execution>
    </executions>
</plugin>
-->
```

Now, we can have randoop generate tests.

```
java \
    -classpath ./randoop-4.1.2/randoop-all-4.1.2.jar:./telefoncenter/telefoncenter/target/at.gv.brz.justiz3.ztc.telefoncenter-jar-with-dependencies.jar:./telefoncenter/telefoncenter/target/at.gv.brz.justiz3.ztc.telefoncenter-classes.jar:/Users/stefan/.m2/repository/javax/servlet/javax.servlet-api/3.1.0/javax.servlet-api-3.1.0.jar \
    randoop.main.Main \
    gentests \
        --classlist=./telefoncenter/telefoncenter/src/test/randoop.classlist \
        --no-error-revealing-tests=true \
        --only-test-public-members=true \
        --output-limit=100
```

