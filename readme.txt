RETO TÉCNICO - PRUEBAS API (PetStore) CON KARATE + REPORTE CUCUMBER (MASTERTHOUGHT)
=================================================================================
----------------------------------------------------
OBJETIVO
----------------------------------------------------
Automatizar pruebas sobre la API pública de PetStore (https://petstore.swagger.io/)
para cubrir los siguientes casos:
1) Añadir una mascota a la tienda
2) Consultar la mascota ingresada previamente (por ID)
3) Actualizar nombre y estatus de la mascota a "sold"
4) Consultar la mascota modificada por estatus (findByStatus)


----------------------------------------------------
TECNOLOGÍAS UTILIZADAS
----------------------------------------------------
- Lenguaje: Java
- JDK: 17 (compatible con 1.8 / 11 / 17 según requerimiento)
- IDE recomendado: IntelliJ IDEA
- Build tool: Gradle 7.6.1 (según requerimiento)
- Framework API Testing: Karate 1.4.1
- JUnit Platform (JUnit 5 - Jupiter) 5.10.2
- Reporte HTML estilo Cucumber: net.masterthought:cucumber-reporting 5.7.6

Dependencias principales (build.gradle):
- com.intuit.karate:karate-junit5:1.4.1
- org.junit.jupiter:junit-jupiter:5.10.2
- net.masterthought:cucumber-reporting:5.7.6
- commons-io:commons-io:2.15.1

----------------------------------------------------
CONFIGURACIÓN DE AMBIENTE (karate-config.js)
----------------------------------------------------
El archivo karate-config.js define el baseUrl por ambiente. Por defecto usa 'dev'.

Ejemplo de baseUrl para PetStore:
https://petstore.swagger.io/v2

Se puede ejecutar indicando ambiente:
- Windows PowerShell:
  .\gradlew test "-Dkarate.env=dev"

----------------------------------------------------
EJECUCIÓN DE LAS PRUEBAS (PASO A PASO)
----------------------------------------------------
- Abrir PowerShell en la raíz del proyecto (donde está gradlew)

    Windows (PowerShell):
    > .\gradlew clean test


- Para correr localmente desde IntelliJ:
  Ejecutar la clase ManagementTest (Runner simple)

Esto:
- Limpia el directorio build/ (por clean)
- Ejecuta las pruebas Karate con JUnit 5
- Genera el JSON de Cucumber y el reporte HTML (a través de ManagementTest)

----------------------------------------------------
REPORTES
----------------------------------------------------
- Reporte HTML Cucumber (Masterthought):
- Ruta:
  build/cucumber-html-reports/cucumber-html-reports/report-feature_<id>.html

- Reporte HTML nativo de Karate
- Ruta:
  build/reports/cucumber/karate-summary.html

----------------------------------------------------
EJECUCIÓN DESDE INTELLIJ (OPCIONAL)
--------------------------------------

- Para generar reporte HTML como ejecución oficial:
  Ejecutar la clase ManagementTest o ejecutar por terminal con Gradle:
  .\gradlew clean test


8. CONSIDERACIONES IMPORTANTES
------------------------------
- Los datos de entrada se parametrizan por archivos JSON/CSV ubicados en:
  src/test/java/pets/data/
- El helper create-pet.feature está mar principal.cado con @ignore para que no se ejecute como prueba directa,
  solo se invoca por call desde el feature
