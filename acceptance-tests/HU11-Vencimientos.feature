# EP03 | HU11 | CA1-CA4
Feature: Recibir alerta de vencimiento anticipada

  Scenario Outline: Guardar anticipación de avisos
    Given que estoy en "Configuración"
    When toco "Alertas" y "Días de anticipación"
    And elijo <dias> días
    And toco "Guardar"
    Then la preferencia queda guardada

    Examples:
      | dias |
      | 3    |
      | 5    |
      | 10   |

  Scenario: Aviso cinco días antes del vencimiento
    Given que configuré 5 días de anticipación
    When faltan 5 días para un vencimiento
    Then recibo "Tu pago de [impuesto] vence en 5 días"
    And veo el botón "Ver detalle"

  Scenario Outline: Recordatorio final de un pago pendiente
    Given que no marqué el pago como realizado
    When faltan <dias> días para el vencimiento
    Then recibo un recordatorio final

    Examples:
      | dias |
      | 1    |
      | 2    |

  Scenario: No enviar recordatorio tras registrar pago
    Given que todavía no llega la fecha del recordatorio
    When toco "Calendario" y abro el vencimiento
    And toco "Marcar como pagado"
    Then no recibo el recordatorio de ese vencimiento
