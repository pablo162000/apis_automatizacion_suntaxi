# Pruebas API (PetStore) con Karate + Reporte Cucumber (Masterthought)
**Autor:** Pablo Suntaxi  
**Proyecto:** Automatizacion Apis

---

## Objetivo
Automatizar pruebas sobre la API pública de **PetStore**
(https://petstore.swagger.io/) para cubrir los siguientes casos:

1. Añadir una mascota a la tienda
2. Consultar la mascota ingresada previamente por **ID**
3. Actualizar el nombre y el estatus de la mascota a **"sold"**
4. Consultar la mascota modificada por estatus (**findByStatus**)

---

## Tecnologías utilizadas
- **Lenguaje:** Java
- **JDK:** 17 (compatible con 1.8 / 11 / 17 según requerimiento)
- **IDE recomendado:** IntelliJ IDEA
- **Build tool:** Gradle 7.6.1
- **Framework API Testing:** Karate 1.4.1
- **Testing Platform:** JUnit 5 (JUnit Jupiter 5.10.2)
- **Reporte HTML estilo Cucumber:**  
  `net.masterthought:cucumber-reporting:5.7.6`

### Dependencias principales (build.gradle)
- `com.intuit.karate:karate-junit5:1.4.1`
- `org.junit.jupiter:junit-jupiter:5.10.2`
- `net.masterthought:cucumber-reporting:5.7.6`
- `commons-io:commons-io:2.15.1`

---

## Prerequisitos
Antes de ejecutar las pruebas, es necesario contar con lo siguiente en la máquina local:

- Sistema operativo Windows / Linux / macOS
- Java JDK 17 instalado
- Variable de entorno **JAVA_HOME** configurada
- IntelliJ IDEA
- Gradle Wrapper incluido en el proyecto

Para validar la instalación de Java:
```bash
java -version
```
## Configuración de ambiente
El archivo `karate-config.js` define el baseUrl según el ambiente.
Por defecto se utiliza el ambiente dev.
### Base URL PetStore
`https://petstore.swagger.io/v2`

## Instrucciones para ejecutar las pruebas
## Ejecución desde terminal
1. Abrir PowerShell en la raíz del proyecto (donde se encuentra gradlew).
### Windows (PowerShell)
```powershell
.\gradlew clean test
```
Este comando realiza las siguientes acciones:
- Limpia el directorio build/ (por clean)
- Ejecuta las pruebas Karate con JUnit 5
- Genera el JSON de Cucumber y el reporte HTML (a través de ManagementTest)t

### Para correr localmente desde IntelliJ:
  Ejecutar la clase ManagementTest (Runner simple)
## Ejecución indicando ambiente
### Windows (PowerShell)
```powershell
.\gradlew test "-Dkarate.env=dev"
```

## Reportes
### Reporte HTML Cucumber (Masterthought):
Ruta:

`build/cucumber-html-reports/cucumber-html-reports/report-feature_<id>.html`
### Reporte HTML nativo de Karate
Ruta:

`build/reports/cucumber/karate-summary.html`

## Información adicional
- Los datos de entrada se parametrizan mediante archivos JSON / CSV ubicados en:
`src/test/java/pets/data/`
- Este feature es utilizado como helper, invocado mediante `call` desde otros
    features para reutilización de lógica.
- La estructura del proyecto sigue las buenas prácticas recomendadas por Karate
  para pruebas API automatizadas.

