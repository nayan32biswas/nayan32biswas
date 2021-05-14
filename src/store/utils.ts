export const namespaced = (namespace: string, asset: string): string => {
  return `${namespace}/${asset}`;
};

// export const buildParams = (params: { [key: string]: any }): string => {
//   const keys = Object.keys(params);
//   if (keys.length == 0) return "";
//   return (
//     "?" +
//     keys
//       .map((key: string) => {
//         return `${key}=${params[key]}`;
//       })
//       .join("&")
//   );
// };
