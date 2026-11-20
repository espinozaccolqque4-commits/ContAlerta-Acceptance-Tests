# EP02 | HU09 | CA1-CA3
Feature: Ver proyección de IGV e Impuesto a la Renta

  Scenario: Consultar proyección con perfil configurado
    Given que tengo movimientos y perfil tributario configurado
    When abro Inicio y toco "Proyección de impuestos"
    Then veo los montos estimados de IGV e Impuesto a la Renta del periodo
    And veo la fecha y hora del cálculo

  Scenario: Advertencia sobre la estimación
    Given que estoy en la proyección
    When consulto la información presentada
    Then veo "Monto estimado, no reemplaza tu declaración oficial"

  Scenario: Solicitar perfil tributario faltante
    Given que no configuré mi perfil tributario
    When toco "Proyección de impuestos"
    Then veo "Configura tu perfil tributario"
    And hay un botón que me lleva a la configuración del perfil
