# EP03 | HU14 | CA1-CA3
Feature: Ver calendario tributario personalizado

  Scenario: Consultar calendario según RUC y perfil
    Given que tengo mi perfil tributario configurado
    When toco "Calendario"
    Then veo los vencimientos del mes según mi perfil
    And las fechas corresponden al último dígito de mi RUC

  Scenario: Marcar vencimiento como pagado
    Given que estoy en el calendario
    When toco un vencimiento y "Marcar como pagado"
    And confirmo
    Then el estado cambia a "Pagado"
    And el vencimiento deja de generar alertas

  Scenario Outline: Navegar entre meses
    Given que estoy en el calendario
    When toco la flecha hacia "<direccion>"
    Then veo los vencimientos del mes "<mes>"

    Examples:
      | direccion | mes       |
      | atrás     | anterior  |
      | adelante  | siguiente |
