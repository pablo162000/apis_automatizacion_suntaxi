Feature: Helper - Crear mascota en PetStore
  @ignore
  Scenario: Crear mascota y retornar datos
    * def urlBase = baseUrl
    * def petPath = '/pet'
    * def createPayload = read('classpath:pets/data/pet-create.json')

    Given url urlBase + petPath
    And request createPayload
    When method POST
    Then status 200
    And match response.id != null

    * def petId = response.id
    * print 'Mascota creada con ID:', petId

    # Retorna el objeto insertado
    * def result = { petId: petId, createPayload: createPayload }