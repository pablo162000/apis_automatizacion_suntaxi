function fn() {

  var env = karate.env;
  karate.log('karate.env system property was:', env);

  // default env
  if (!env) {
    env = 'dev';
  }

  // URLs por ambiente
  var baseUrls = {
    dev: 'https://petstore.swagger.io/v2',
  };

  var config = {
    env: env,
    baseUrl: baseUrls[env]
  };

  // logs
  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);

  // timeouts
  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 10000);

  return config;
}