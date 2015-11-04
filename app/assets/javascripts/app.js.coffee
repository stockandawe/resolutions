app = angular.module('myResolutions', ['ngResource'])

app.controller 'myResolutionsCtrl', ['$scope', '$resource', '$rootScope', ($scope, $resource, $rootScope) ->
  Resolution = $resource('/resolutions/:id')

  $scope.resolutions = Resolution.query()

  $scope.addResolution = ->
    Resolution.save(resolution: $scope.pendingResolution)
    $rootScope.$broadcast("newEvent")
    $scope.resolutions.push($scope.pendingResolution)
    $scope.pendingResolution = ""
]

app.controller 'myEventsCtrl', ['$scope', '$resource', ($scope, $resource) ->
  Event = $resource('/events.json/:id')

  getEvents = ->
    $scope.events = Event.query()

  $scope.$on("newEvent", getEvents)

  getEvents()
]
