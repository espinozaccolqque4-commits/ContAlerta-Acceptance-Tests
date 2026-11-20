# EP02 | HU08 | CA1-CA3
Feature: Ver semáforo con indicación de qué hacer

  Scenario: Semáforo verde cuando el usuario está al día
    Given que no tengo vencimientos próximos ni comprobantes observados
    When abro Inicio
    Then el semáforo está en verde
    And veo el mensaje "Estás al día"

  Scenario Outline: Mostrar acción ante un pendiente
    Given que tengo un pendiente de tipo "<pendiente>"
    When abro Inicio y toco "¿Qué hago?"
    Then el semáforo está en amarillo o rojo
    And veo una acción concreta y un botón que me lleva a la pantalla correspondiente

    Examples:
      | pendiente              |
      | vencimiento cercano    |
      | comprobante observado  |

  Scenario: Cambiar semáforo después de resolver un pendiente
    Given que el semáforo está en amarillo o rojo
    When toco la acción sugerida
    And resuelvo el pendiente
    And vuelvo a Inicio
    Then el semáforo cambia de color
