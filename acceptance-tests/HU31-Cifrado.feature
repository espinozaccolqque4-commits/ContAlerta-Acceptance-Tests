# EP08 | HU31 | CA1-CA2 | Pruebas no funcionales
Feature: Cifrado de la información

  Scenario: Inspeccionar cifrado de comunicaciones
    Given un evaluador con una herramienta de captura de tráfico
    When inicia sesión en la app
    And registra un movimiento
    And revisa las comunicaciones
    Then todas usan TLS 1.2 o superior
    And ninguna viaja por HTTP

  Scenario: Inspeccionar protección de datos almacenados
    Given un integrante autorizado con acceso a la base de datos
    When consulta las tablas de usuarios y movimientos
    Then los datos sensibles como montos, RUC o credenciales figuran cifrados con AES-256
    And el PIN no se ve en texto plano
