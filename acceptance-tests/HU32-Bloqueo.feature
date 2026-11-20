# EP08 | HU32 | CA1-CA3 | Pruebas no funcionales
Feature: Bloqueo de acceso e inactividad

  Scenario: Bloquear tras cinco PIN incorrectos
    Given que estoy en la pantalla de PIN
    When ingreso un PIN incorrecto 5 veces seguidas
    Then la cuenta se bloquea durante 15 minutos
    And veo un temporizador

  Scenario: Impedir acceso mientras continúa el bloqueo
    Given que estoy bloqueado
    When ingreso el PIN correcto
    Then no accedo a la app
    And veo el tiempo restante

  Scenario: Cerrar sesión después de inactividad
    Given que inicié sesión
    When dejo la app sin tocarla durante 5 minutos
    Then la sesión se cierra
    And se pide el PIN
