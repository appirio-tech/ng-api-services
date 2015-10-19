(function() {
  'use strict';
  var dependencies;

  dependencies = ['ui.router', 'ngResource', 'app.constants'];

  angular.module('appirio-tech-ng-api-services', dependencies);

}).call(this);

(function() {
  'use strict';
  var srv, transformResponse;

  transformResponse = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return (parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0) || {};
  };

  srv = function($resource, API_URL) {
    var actions, params, url;
    url = API_URL + '/v3/users/:id';
    params = {
      id: '@id'
    };
    actions = {
      get: {
        method: 'GET',
        isArray: false,
        transformResponse: transformResponse
      },
      post: {
        method: 'POST'
      }
    };
    return $resource(url, params, actions);
  };

  srv.$inject = ['$resource', 'API_URL'];

  angular.module('appirio-tech-ng-api-services').factory('UserV3APIService', srv);

}).call(this);

(function() {
  'use strict';
  var srv;

  srv = function($resource, API_URL) {
    var params, url;
    url = API_URL + '/v3/authorizations/:id';
    params = {
      id: '@id'
    };
    return $resource(url, params);
  };

  srv.$inject = ['$resource', 'API_URL'];

  angular.module('appirio-tech-ng-api-services').factory('AuthorizationsAPIService', srv);

}).call(this);

(function() {
  'use strict';
  var srv, transformResponse;

  transformResponse = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return (parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0) || [];
  };

  srv = function($resource, API_URL) {
    var methods, params, url;
    url = API_URL + '/v3/messages/:id';
    params = {
      id: '@id'
    };
    methods = {
      post: {
        method: 'POST'
      },
      patch: {
        method: 'PATCH'
      },
      put: {
        method: 'PUT'
      }
    };
    return $resource(url, {}, methods);
  };

  srv.$inject = ['$resource', 'API_URL'];

  angular.module('appirio-tech-ng-api-services').factory('MessagesAPIService', srv);

}).call(this);

(function() {
  'use strict';
  var acceptFixes, confirmRanks, srv, transformMultiple, transformRequest, transformSingle;

  transformSingle = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return (parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0) || {};
  };

  transformMultiple = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return (parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0) || [];
  };

  transformRequest = function(data) {
    var transformedData;
    transformedData = {
      param: data
    };
    return JSON.stringify(transformedData);
  };

  confirmRanks = function(data) {
    var customerConfirmedRanks, transformedData;
    if (data != null ? data.hasOwnProperty('customerConfirmedRanks') : void 0) {
      customerConfirmedRanks = data.customerConfirmedRanks;
    } else {
      customerConfirmedRanks = data;
    }
    transformedData = {
      param: {
        details: {
          customerConfirmedRanks: customerConfirmedRanks
        }
      }
    };
    return JSON.stringify(transformedData);
  };

  acceptFixes = function(data) {
    var customerAcceptedFixes, transformedData;
    if (data != null ? data.hasOwnProperty('customerAcceptedFixes') : void 0) {
      customerAcceptedFixes = data.customerAcceptedFixes;
    } else {
      customerAcceptedFixes = data;
    }
    transformedData = {
      param: {
        details: {
          customerAcceptedFixes: customerAcceptedFixes
        }
      }
    };
    return JSON.stringify(transformedData);
  };

  srv = function($resource, API_URL) {
    var methods, params, url;
    url = API_URL + '/v3/projects/:projectId/steps/:stepId';
    params = {
      projectId: '@projectId',
      stepId: '@stepId'
    };
    methods = {
      get: {
        transformResponse: transformSingle
      },
      query: {
        transformResponse: transformMultiple,
        isArray: true
      },
      patch: {
        method: 'PATCH',
        transformRequest: transformRequest,
        transformResponse: transformSingle
      }
    };
    return $resource(url, params, methods);
  };

  srv.$inject = ['$resource', 'API_URL'];

  angular.module('appirio-tech-ng-api-services').factory('StepsAPIService', srv);

}).call(this);

(function() {
  'use strict';
  var srv, transformMultiple, transformSingle;

  transformSingle = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return (parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0) || {};
  };

  transformMultiple = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return (parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0) || [];
  };

  srv = function($resource, API_URL) {
    var methods, params, url;
    url = API_URL + '/v3/projects/:projectId/steps/:stepId/submissions/:submissionId';
    params = {
      projectId: '@projectId',
      stepId: '@stepId',
      submissionId: '@submissionId'
    };
    methods = {
      get: {
        transformResponse: transformSingle
      },
      query: {
        transformResponse: transformMultiple,
        isArray: true
      }
    };
    return $resource(url, params, methods);
  };

  srv.$inject = ['$resource', 'API_URL'];

  angular.module('appirio-tech-ng-api-services').factory('SubmissionsAPIService', srv);

}).call(this);

(function() {
  'use strict';
  var srv, transformResponse;

  transformResponse = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return (parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0) || {};
  };

  srv = function($resource, API_URL) {
    var actions, params, url;
    url = API_URL + '/v3/threads/:id';
    params = {
      id: '@id',
      subscriberId: '@subscriberId'
    };
    actions = {
      query: {
        method: 'GET',
        isArray: false,
        transformResponse: transformResponse
      },
      get: {
        method: 'GET',
        isArray: false,
        transformResponse: transformResponse
      }
    };
    return $resource(url, params, actions);
  };

  srv.$inject = ['$resource', 'API_URL'];

  angular.module('appirio-tech-ng-api-services').factory('ThreadsAPIService', srv);

}).call(this);

(function() {
  'use strict';
  var srv, transformResponse;

  transformResponse = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return (parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0) || [];
  };

  srv = function($resource, API_URL) {
    var methods, params, url;
    url = API_URL + '/v3/projects/:workId/timeline';
    params = {
      workId: '@workId'
    };
    methods = {
      query: {
        method: 'GET',
        isArray: true,
        transformResponse: transformResponse
      },
      get: {
        method: 'GET',
        isArray: false,
        transformResponse: transformResponse
      }
    };
    return $resource(url, params, methods);
  };

  srv.$inject = ['$resource', 'API_URL'];

  angular.module('appirio-tech-ng-api-services').factory('TimelineAPIService', srv);

}).call(this);

(function() {
  'use strict';
  var srv, transformResponse;

  transformResponse = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return (parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0) || [];
  };

  srv = function($resource, API_URL) {
    var methods, params, url;
    url = API_URL + '/v3/work/:id';
    params = {
      id: '@id'
    };
    methods = {
      put: {
        method: 'PUT',
        isArray: false,
        transformResponse: transformResponse
      },
      get: {
        method: 'GET',
        isArray: true,
        transformResponse: transformResponse
      }
    };
    return $resource(url, params, methods);
  };

  srv.$inject = ['$resource', 'API_URL'];

  angular.module('appirio-tech-ng-api-services').factory('WorkAPIService', srv);

}).call(this);

(function() {
  'use strict';
  var srv, transformIdOnlyResponse, transformResponse;

  transformResponse = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0;
  };

  transformIdOnlyResponse = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return {
      id: parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0
    };
  };

  srv = function($resource, API_URL) {
    var methods, params, url;
    url = API_URL + '/v3/work/:id';
    params = {
      id: '@id'
    };
    methods = {
      put: {
        method: 'PUT',
        transformResponse: transformIdOnlyResponse
      },
      post: {
        method: 'POST',
        transformResponse: transformIdOnlyResponse
      },
      get: {
        transformResponse: transformResponse
      },
      query: {
        transformResponse: transformResponse
      }
    };
    return $resource(url, params, methods);
  };

  srv.$inject = ['$resource', 'API_URL'];

  angular.module('appirio-tech-ng-api-services').factory('SubmitWorkAPIService', srv);

}).call(this);

(function() {
  'use strict';
  var srv, transformResponse;

  transformResponse = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return (parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0) || [];
  };

  srv = function($resource, API_URL) {
    var methods, params, url;
    url = API_URL + '/v3/work/:workId';
    params = {
      workId: '@workId'
    };
    methods = {
      query: {
        method: 'GET',
        isArray: true,
        transformResponse: transformResponse
      },
      get: {
        method: 'GET',
        isArray: false,
        transformResponse: transformResponse
      }
    };
    return $resource(url, {}, methods);
  };

  srv.$inject = ['$resource', 'API_URL'];

  angular.module('appirio-tech-ng-api-services').factory('CopilotProjectsAPIService', srv);

}).call(this);

(function() {
  'use strict';
  var srv, transformResponse;

  transformResponse = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return (parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0) || [];
  };

  srv = function($resource, API_URL) {
    var methods, params, url;
    url = API_URL + '/v3/copilots/:userId/projects/:projectId';
    params = {
      userId: '@userId',
      projectId: '@projectId'
    };
    methods = {
      query: {
        method: 'GET',
        isArray: true,
        transformResponse: transformResponse
      },
      put: {
        method: 'PUT',
        isArray: false,
        transformResponse: transformResponse
      },
      post: {
        method: 'POST',
        isArray: false,
        transformResponse: transformResponse
      }
    };
    return $resource(url, {}, methods);
  };

  srv.$inject = ['$resource', 'API_URL'];

  angular.module('appirio-tech-ng-api-services').factory('CopilotProjectDetailsAPIService', srv);

}).call(this);

(function() {
  'use strict';
  var srv, transformResponse;

  transformResponse = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return (parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0) || {};
  };

  srv = function($resource, API_URL) {
    var methods, params, url;
    url = API_URL + '/v3/copilots/:userId/projects/:projectId/approved';
    params = {
      userId: '@userId',
      projectId: '@projectId'
    };
    methods = {
      post: {
        method: 'POST',
        isArray: false,
        transformResponse: transformResponse
      }
    };
    return $resource(url, {}, methods);
  };

  srv.$inject = ['$resource', 'API_URL'];

  angular.module('appirio-tech-ng-api-services').factory('CopilotApprovalAPIService', srv);

}).call(this);

(function() {
  'use strict';
  var srv, transformResponse;

  transformResponse = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return (parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0) || [];
  };

  srv = function($resource, API_URL) {
    var methods, params, url;
    url = API_URL + '/v3/projects/:projectId/submissions/:submissionId/threads/:threadId/messages';
    params = {
      projectId: '@projectId',
      submissionId: '@submissionId',
      threadId: '@threadId'
    };
    methods = {
      get: {
        method: 'GET'
      },
      query: {
        method: 'GET',
        isArray: true
      },
      post: {
        method: 'POST'
      },
      patch: {
        method: 'PATCH'
      },
      put: {
        method: 'PUT'
      }
    };
    return $resource(url, {}, methods);
  };

  srv.$inject = ['$resource', 'API_URL'];

  angular.module('appirio-tech-ng-api-services').factory('SubmissionsMessagesAPIService', srv);

}).call(this);

(function() {
  'use strict';
  var srv, transformResponse;

  transformResponse = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return (parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0) || [];
  };

  srv = function($resource, API_URL) {
    var methods, params, url;
    url = API_URL + '/v3/inboxes/:threadId/messages/:messageId';
    params = {
      threadId: '@threadId',
      messageId: '@messageId'
    };
    methods = {
      post: {
        method: 'POST'
      },
      patch: {
        method: 'PATCH'
      },
      put: {
        method: 'PUT'
      }
    };
    return $resource(url, {}, methods);
  };

  srv.$inject = ['$resource', 'API_URL'];

  angular.module('appirio-tech-ng-api-services').factory('MessageUpdateAPIService', srv);

}).call(this);

(function() {
  'use strict';
  var srv, transformIdOnlyResponse, transformResponse;

  transformResponse = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0;
  };

  transformIdOnlyResponse = function(response) {
    var parsed, ref;
    parsed = JSON.parse(response);
    return {
      id: parsed != null ? (ref = parsed.result) != null ? ref.content : void 0 : void 0
    };
  };

  srv = function($resource, API_URL) {
    var methods, params, url;
    url = API_URL + '/v3/projects/:id';
    params = {
      id: '@id'
    };
    methods = {
      put: {
        method: 'PUT',
        transformResponse: transformIdOnlyResponse
      },
      post: {
        method: 'POST',
        transformResponse: transformIdOnlyResponse
      },
      get: {
        transformResponse: transformResponse
      },
      query: {
        transformResponse: transformResponse
      }
    };
    return $resource(url, params, methods);
  };

  srv.$inject = ['$resource', 'API_URL'];

  angular.module('appirio-tech-ng-api-services').factory('ProjectsAPIService', srv);

}).call(this);
