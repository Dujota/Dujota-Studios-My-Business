// In this file we want to configure the two core entities of the Apollo application, the client and the cache (or more precisely, the functions to create both):

// Client
import { ApolloClient } from 'apollo-client';

// Cache
import { InMemoryCache } from 'apollo-cache-inmemory';

// Links
import { HttpLink } from 'apollo-link-http';
import { onError } from 'apollo-link-error';
import { ApolloLink, Observable } from 'apollo-link';

// CREATE CACHE
export const createCache = () => {
  const cache = new InMemoryCache();

  if (process.env.NODE_ENV === 'development') {
    window.apolloCacheDevelopmentOnly = cache;
  }

  return cache;
};

// Get Token from Meta Tags on Application.html.erb

const getToken = () => {
  document.querySelector('meta[name="csrf-token"]').getAttribute('content');
};
const token = getToken();

// MiddleWare Operationt that sets the CSRF token on requests to protect from forgery
const setTokenForOperation = async operation =>
  operation.setContext({
    headers: {
      'X-CSRF-Token': token,
    },
  });

// Link With CSRF Token
const createLinkWithToken = () =>
  new ApolloLink(
    (operation, forward) =>
      new Observable(observer => {
        let handle;
        Promise.resolve(operation)
          .then(setTokenForOperation)
          .then(() => {
            handle = forward(operation).subscribe({
              next: observer.next.bind(observer),
              error: observer.error.bind(observer),
              complete: observer.complete.bind(observer),
            });
          })
          .catch(observer.error.bind(observer));

        return () => {
          if (handle) handle.unsubscribe();
        };
      })
  );
