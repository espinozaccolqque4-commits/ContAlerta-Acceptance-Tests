# EP03 | HU13 | CA1-CA3
Feature: Alertar comprobante anulado o con error

  Scenario: Detectar anulación en consulta diaria
    Given que vinculé mi RUC
    When la consulta diaria detecta un comprobante anulado
    Then recibo "El comprobante F001-123 fue anulado"

  Scenario Outline: Consultar alerta y ejecutar una acción
    Given que recibí una alerta de comprobante
    When toco la notificación
    Then veo número, fecha, monto, estado y motivo
    When toco "<accion>"
    Then se ejecuta la acción elegida

    Examples:
      | accion              |
      | Solicitar corrección |
      | Cerrar              |

  Scenario: Pedir vinculación del RUC
    Given que no vinculé mi RUC
    When abro "Alertas"
    Then veo "Vincula tu RUC para recibir estas alertas"
    And veo un botón que me lleva a la vinculación
