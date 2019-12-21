// In this file we want to configure the two core entities of the Apollo application, the client and the cache (or more precisely, the functions to create both):

// Client
import { ApolloClient } from 'apollo-client';

// Cache
import { InMemoryCache } from 'apollo-cache-inmemory';

// Links
import { HttpLink } from 'apollo-link-http';
import { onError } from 'apollo-link-error';
import { ApolloLink, Observable } from 'apollo-link';

export const createCache = () => {
  const cache = new InMemoryCache();

  if (process.env.NODE_ENV === 'development') {
    window.apolloCacheDevelopmentOnly = cache;
  }

  return cache;
};
