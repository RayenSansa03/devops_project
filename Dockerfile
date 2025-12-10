FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

# Copie n'importe quel JAR généré par Spring Boot (même si le nom change)
COPY target/*.jar app.jar

EXPOSE 8089

# Sécurité : utilisateur non-root
RUN addgroup --system spring && adduser --system --group spring
USER spring

ENTRYPOINT ["java", "-jar", "app.jar"]