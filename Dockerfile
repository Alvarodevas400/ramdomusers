# ───────────────────────────────────────────────────────────────────────────────
# Etapa 1: Construcción (builder) usando Maven
# ───────────────────────────────────────────────────────────────────────────────
FROM maven:3.9-eclipse-temurin-21 AS build

# Directorio de trabajo dentro del contenedor de build
WORKDIR /app

# 1. Copiamos pom.xml y descargamos dependencias (sin copiar todo el código aún)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# 2. Copiamos el resto del código fuente de la aplicación
COPY src ./src

# 3. Compilamos y empaquetamos la aplicación en un JAR (omitiendo tests para agilizar).
RUN mvn clean package -DskipTests

# ───────────────────────────────────────────────────────────────────────────────
# Etapa 2: Imagen de ejecución (runtime) con solo el JAR empaquetado
# ───────────────────────────────────────────────────────────────────────────────
FROM eclipse-temurin:21-jre

# Directorio de trabajo donde vivirá la aplicación
WORKDIR /app

# 4. Copiamos el JAR construido desde la etapa “build”
COPY --from=build /app/target/*.jar ./app.jar

# 5. Exponemos el puerto que utiliza Spring Boot (por defecto 8080)
EXPOSE 8080

# 6. Definimos el comando que arranca la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
