# EP08 | HU34 | CA1-CA2 | Pruebas no funcionales
Feature: Rendimiento del termómetro y el semáforo

  Scenario: Medir tiempo de carga de Inicio
    Given una cuenta con 1000 movimientos y conexión 4G
    When abro la app e ingreso mi PIN
    And mido 20 veces el tiempo hasta que Inicio muestra el termómetro y el semáforo
    Then al menos el 95 por ciento de las mediciones tarda 3 segundos o menos

  Scenario: Indicar progreso ante carga lenta
    Given que la app está cargando Inicio
    When la carga supera los 3 segundos
    Then veo un indicador de progreso mientras espero
