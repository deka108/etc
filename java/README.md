# Java

## Version Management

Tool: [sdkman](https://github.com/jenv/jenv)

Installation and Setup:

```bash
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
```

## Installing Java or JVM-based related language, framework, and tools

### JVM-Based Language and Framework

| Language/Framework | Install Command |
| --- | --- |
| Java | `sdk install java` |
| Spark | `sdk install spark` |
| Scala | `sdk install scala` |
| SpringBoot | `sdk install springboot` |

### Dependency Tools

| Tool | Install Command |
| --- | --- |
| Gradle | `sdk install gradle` |
| Maven | `sdk install maven` |

## Dependency Management (Java)

Preferred Tool: [gradle](https://github.com/gradle/gradle)

## IDE

[Intellij](https://www.jetbrains.com/idea/)

| Version | Install Command |
| --- | --- |
| Community Edition | `brew cask install intellij-idea-ce` |
|  Ultimate | `brew cask install intellij-idea` |

https://www.jetbrains.com/idea/download/#section=mac

## Exploration Tools

### [Apache Zeppelin](https://zeppelin.apache.org/)

For exploring in Scala (esp Data Science and Machine Learning). For setting up zeppelin, you can read [this guide](../python/README.md#exploration-with-apache-zeppelin)