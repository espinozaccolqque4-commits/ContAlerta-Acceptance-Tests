
Feature: Ver termometro de impuestos - HU07

  Scenario: Mostrar impuesto acumulado
    Given que tengo movimientos del periodo
    When abro la app e ingreso mi PIN
    Then Inicio muestra el termometro
    And veo el impuesto acumulado en soles y su nivel

  Scenario: Actualizar impuesto acumulado
    Given que estoy en Inicio
    When toco "Registrar movimiento"
    And registro un ingreso y toco "Guardar"
    And vuelvo a Inicio
    Then el termometro muestra el nuevo acumulado

  Scenario: Consultar detalle del impuesto
    Given que estoy en Inicio
    When toco el termometro
    Then veo el monto separado en IGV e Impuesto a la Renta

  Scenario: Mostrar termometro sin movimientos
    Given que no tengo movimientos
    When ingreso a Inicio
    Then el termometro marca S/ 0
    And veo "Registra tu primer ingreso"
