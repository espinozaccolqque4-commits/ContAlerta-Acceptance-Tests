# EP08 | HU37 | CA1-CA2 | Pruebas no funcionales
Feature: Disponibilidad del servicio

  Scenario: Comprobar disponibilidad mensual
    Given un mes de operación con monitoreo activo
    When se calcula el tiempo disponible
    Then es de 99.5 por ciento o más

  Scenario: Comunicar mantenimiento fuera de fechas críticas
    Given que el equipo programa un mantenimiento
    When fija la fecha y envía el aviso a los usuarios
    And verifica el calendario tributario
    Then el aviso se envía con 48 horas de anticipación
    And la fecha no cae en los 5 días previos a un vencimiento
