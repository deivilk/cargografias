'use strict';

/* Filters */

angular.module('cargoApp.factories', [])
  .factory('cargoLoaderFactory', function($http, $filter) {
    
    var datasources = [];

    var cargografiasSources = [];

    var instanceName = window.location.pathname.replace(/\/$/, '').replace(/^\//, '');
    instanceName = instanceName || 'cargografias';
    
    cargografiasSources.push(window.__config.baseStaticPath + '/datasets/' + instanceName + '-persons.json');
    cargografiasSources.push(window.__config.baseStaticPath + '/datasets/' + instanceName + '-memberships.json');
    cargografiasSources.push(window.__config.baseStaticPath + '/datasets/' + instanceName + '-organizations.json');

    var currentDataSource = cargografiasSources;

    var f = {};

    f.load = function($scope,factory,callback, $rootScope){
              $http.get(currentDataSource[0])
                 .then(function(res){
                  $rootScope.estado = "Personas";
                  factory.persons = res.data;
                    for (var i = 0; i < res.data.length; i++) {
                      //Search Index
                      var item = res.data[i]
                      res.data[i].index = i;
                      f.processImages(item);
                      f.setInitials(item);
                      //TODO: This should come 100% from data. Remove in the future
                      try{
                        f.setShareableID(item);
                        f.setCheaqueadoCheck(item);
                        f.processMemberships(item);
                      }
                      catch(e){
                        console.log("No Id?-", res.data[i].name, res.data[i].id_sha1);
                      }
                      
                      factory.mapId[item.popitID] = i;
                      factory.autoPersons.push(item);
                    };
              }).then(function(){
                  $http.get(currentDataSource[2])
                    .then(function(res){
                      $rootScope.estado = "Organizaciones";
                      factory.organizations = res.data;
                      //TODO: Why is this here? Shouldn't go to organization level attribute?
                      //nivel: res.data[i].name === 'Argentina' ? 'nacional' : 'provincial'
                  }).then(callback);
                });
  };

  //Photo or default photo
  f.processImages = function(d){
    
    try{
      d.image = d.images ? d.images[0].url :'/img/person.png'    // get popit picture
    }
    catch(e){
      d.image = '/img/person.png' ;
    }
  };

  //Initials for graphics
  f.setInitials = function(d){
    var splitedName =  d.name.split(' ')
    d.initials = d.name ? splitedName.map(function(item){ return item.substr(0,1).toUpperCase() }).join('.') + "." : '-';  
                    
  }

  f.setShareableID = function(d){
    d.popitID = d.id_sha1.substring(0,6);
  }

  f.setCheaqueadoCheck = function(d){
    d.chequeado = false;
    if (chequeados.indexOf(d.popitID) > -1){
      d.chequeado = true;
    }
  }

  f.processMemberships = function(d){
    for (var i = 0; i < d.memberships.length; i++) {  
      var m = d.memberships[i];
      
      if (m.area){
          var z = m.area.id.trim();
          //HACK: Forcing load of territories.
          if (z.split(',').length === 1){
            z = z.replace(/ ,/g,' ')
          }
          m.area.id = toTitleCase(z);
          m.area.name =  toTitleCase(z); 
          //HACK: To use angular filter
          m.area_name =  toTitleCase(z); 
        }
      else {
        console.log('No area found: memberships',m.id);
          m.area ={
            id: "AREA-NOT-FOUND",
            name: "AREA-NOT-FOUND",
          };
          m.area_name = "AREA-NOT-FOUND";
      }
    }
                 
  }




  return f;
});

//TODO: this should be on popit, hard hack for Elections BA.
var chequeados = ["2c109a", "55a99b","5928af", "1d3338", "f4b3f5"];

