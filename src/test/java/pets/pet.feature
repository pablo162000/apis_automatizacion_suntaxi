Feature: PetStore API - Casos NTTDATA

  Background:
    * def urlBase = baseUrl
    * def petPath = '/pet'
    * def updateData = read('classpath:pets/data/pet-update.json')
    * def statusData = read('classpath:pets/data/status.csv')

  Scenario: 1) Añadir una mascota a la tienda
    * def result = call read('classpath:pets/create-pet.feature')
    * match result.petId != null

  Scenario: 2) Consultar la mascota ingresada previamente (Búsqueda por ID)
    * def result = call read('classpath:pets/create-pet.feature')
    * def petId = result.petId
    * def createPayload = result.createPayload

    Given url urlBase + petPath + '/' + petId
    When method GET
    Then status 200
    And match response.id == petId
    And match response.name == createPayload.name

  Scenario: 3) Actualizar el nombre de la mascota y el estatus a "sold"
    * def result = call read('classpath:pets/create-pet.feature')
    * def petId = result.petId
    * def createPayload = result.createPayload

    * def updatePayload =
    """
    {
      "id": "#(petId)",
      "category": "#(createPayload.category)",
      "name": "#(updateData.name)",
      "photoUrls": "#(createPayload.photoUrls)",
      "tags": "#(createPayload.tags)",
      "status": "#(updateData.status)"
    }
    """

    Given url urlBase + petPath
    And request updatePayload
    When method PUT
    Then status 200
    And match response.id == petId
    And match response.status == 'sold'

  Scenario: 4) Consultar la mascota modificada por estatus (Búsqueda por estatus)
    * def result = call read('classpath:pets/create-pet.feature')
    * def petId = result.petId
    * def createPayload = result.createPayload

    # Se actualiza a sold para asegurar el escenario
    * def updatePayload =
    """
    {
      "id": "#(petId)",
      "category": "#(createPayload.category)",
      "name": "Pet-Status-Check",
      "photoUrls": "#(createPayload.photoUrls)",
      "tags": "#(createPayload.tags)",
      "status": "sold"
    }
    """

    Given url urlBase + petPath
    And request updatePayload
    When method PUT
    Then status 200

    * def status = statusData[0].status

    Given url urlBase + petPath + '/findByStatus?status=' + status
    When method GET
    Then status 200
    And match each response[*].status == status

    * def ids = $response[*].id
    * match ids contains petId
