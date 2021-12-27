local dep  = import "deployment.jsonnet";
local svc = import "service.jsonnet";

{
  kind: "List",
  apiVersion: "v1",
  items: [
    dep ,
    svc,
  ]
}
