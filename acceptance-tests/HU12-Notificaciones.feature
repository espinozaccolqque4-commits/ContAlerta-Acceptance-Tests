# EP03 | HU12 | CA1-CA3
Feature: Configurar preferencias de notificación

  Scenario Outline: Guardar un canal de notificación
    Given que estoy en "Configuración"
    When toco "Notificaciones" y activo "<canal>"
    And confirmo mi número o correo si se solicita
    And toco "Guardar"
    Then las alertas llegan por el canal elegido

    Examples:
      | canal       |
      | En la app   |
      | WhatsApp    |
      | SMS         |
      | Correo      |

  Scenario: Advertir al desactivar todos los canales
    Given que estoy en "Notificaciones"
    When desactivo todos los canales y toco "Guardar"
    Then veo una advertencia
    And la app mantiene las notificaciones dentro de la app

  Scenario Outline: Respetar la frecuencia configurada
    Given que estoy en "Notificaciones"
    When activo "<preferencia>" y toco "Guardar"
    Then recibo un solo aviso diario con las notificaciones no urgentes
    And las alertas críticas de semáforo rojo siguen llegando de inmediato

    Examples:
      | preferencia          |
      | Resumen diario       |
      | Silenciar no urgentes |
