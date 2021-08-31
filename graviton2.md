# java 8

```sh
sdk install java 8.0.302-zulu
```

# compile dremio on graviton2

```sh
git clone https://github.com/dremio/dremio-oss.git dremio

cd dremio

./mvnw clean compile -DskipTests -Dlicense.skip=true -Ddremio.oss-only=true
```

