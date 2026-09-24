# Hybrid Infrastructure Defense-in-Dept

## Descripción del Proyecto
Este proyecto implementa un laboratorio automatizado enfocado en la emulación de adversarios, respuesta a incidentes en entornos híbridos y endurecimiento de sistemas operativos. Se simula una cadena de ataque compleja (compromiso por Ransomware y abuso de identidades) para posteriormente ejecutar tareas de análisis forense digital en vivo (Live Response), preservación de la cadena de custodia mediante hashing criptográfico y mitigación de riesgos a través de auditorías avanzadas e integridad de archivos (FIM).

## Competencias Técnicas Demostradas (Key Professional Skills)
* **Investigative Mindset & Documentation**: Capacidad demostrada para descubrir, identificar, capturar y documentar información crítica de eventos de seguridad y artefactos del sistema dentro de un reporte forense cohesivo y estructurado.
* **Analytical Skills in Security Analysis**: Aplicación constante de habilidades analíticas sobre los requisitos del sistema operativo e identidades de red para identificar vulnerabilidades y desplegar las soluciones de endurecimiento (hardening) más adecuadas.

## Estructura del Repositorio
* **automation/**: Scripts automatizados para la emulación del ataque y recolección forense de evidencias volátiles.
* **evidence/**: Directorio destinado al almacenamiento de artefactos y recursos comprometidos bajo cadena de custodia.
* **hardening/**: Directivas de endurecimiento, análisis analítico de identidades locales y auditoría de parches de seguridad.
* **logs/**: Registros locales sobre la ejecución de ataques y auditorías.
* **reports/**: Reportes forenses detallados generados de manera automatizada.

## Componentes Desarrollados

### 1. Módulo Ofensivo (Simulación de Ransomware)
* **Archivo**: `automation/simulate_attack.ps1`
* **Función**: Simula el compromiso inicial cifrando archivos críticos (`.xlsx`, `.txt`) convirtiéndolos a codificación Base64 con extensión `.locked`, registrando el incidente en las bitácoras del sistema.

### 2. Módulo de Respuesta a Incidentes (Live Forensics)
* **Archivo**: `automation/live_forensics.ps1`
* **Función**: Captura de forma automatizada artefactos volátiles (procesos activos y conexiones de red TCP). Realiza la fijación de la evidencia digital aplicando algoritmos SHA256 sobre los elementos modificados para garantizar el principio de no alteración ante auditorías.

### 3. Módulo Defensivo Avanzado (Hardening, Identity Audit & FIM)
* **Archivo**: `hardening/apply_hardening.ps1`
* **Función**: 
  * **Análisis de Identidades**: Identifica de forma analítica usuarios activos con configuraciones de contraseñas vulnerables.
  * **Investigación de Parches**: Ejecuta una auditoría automatizada de los parches de seguridad instalados (Hotfixes).
  * **Monitoreo de Integridad (FIM)**: Establece una línea base de integridad mediante hashing SHA256 sobre archivos críticos de configuración de red (`hosts`).

## Requisitos de Ejecución
* Sistema Operativo Windows 10/11 o Windows Server.
* PowerShell 5.1 o superior.
