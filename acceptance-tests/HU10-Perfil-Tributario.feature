# EP02 | HU10 | CA1-CA3
Feature: Configurar perfil tributario

  Scenario Outline: Guardar un perfil tributario permitido
    Given que estoy en "Configuración"
    When toco "Perfil tributario"
    And elijo "<perfil>"
    And toco "Guardar"
    Then el sistema aplica las fórmulas y fechas de ese perfil

    Examples:
      | perfil                                    |
      | Persona natural con negocio               |
      | Trabajador independiente (cuarta categoría) |
      | Persona jurídica                          |

  Scenario: Confirmar cambio de perfil
    Given que ya tengo un perfil tributario
    When elijo otro perfil y toco "Guardar"
    And confirmo en "Se recalcularán tus montos"
    Then los montos del periodo se recalculan

  Scenario: Cancelar cambio de perfil
    Given que ya tengo un perfil tributario y elegí otro
    When toco "Cancelar" en la confirmación
    Then se mantiene el perfil anterior
