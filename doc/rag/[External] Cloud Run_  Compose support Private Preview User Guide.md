# [External] Cloud Run: Docker compose support Private Preview

## Prerequisites

* gcloud version 532.0 or later, with ‘alpha’ commands installed
* GCP project with Cloud Run enabled

## Limitations

1. This is a **Private Preview**, and not supported for production use cases
2. This preview is `gcloud` CLI only.
3. This initial preview only supports a limited subset of compose functionality (see below), which will incrementally expand. Notably, this release *does not yet* include the new `models` functionality recently added to Compose.

## Deploying a compose.yaml file to cloud run

* Go to a directory with an existing compose.yaml file.  If you don’t have a compose file, go to the [Docker Compose Quickstart](https://docs.docker.com/compose/gettingstarted/#step-1-set-up) and follow steps 1 and 2

* Run `gcloud alpha run compose up`.  You can optionally provide a specific file name as an input parameter.

When the deployment completes, you’ll receive the deployed URL for your Cloud Run service, with authentication required by default.  You can test the webapp by using `gcloud run services proxy [servicename]`, or disable the authentication requirement from the cloud console.

## Deleting the deployed Cloud Run service

Use `gcloud run services delete [servicename]` to delete the Cloud Run service.

# Supported `compose.yaml` Schema

The `run-compose` tool translates a subset of the Compose specification into a deployable, multi-container Google Cloud Run service. It uses standard Docker Compose fields where possible and introduces custom extensions for Cloud Run-specific features.

## Service Configuration

This section defines the containers that will be deployed to the Cloud Run service.

| Key | Type | Description |
| :---- | :---- | :---- |
| `build` | String or Object | **Supported.** If present, `run-compose` will use `gcloud builds submit` to build a container image from the specified context. The resulting image will be tagged and pushed to the repository provided by the `--repo` flag. |
| `image` | String | **Supported.** Use this if you have a pre-built image. If `build` is specified, this field is ignored as the tool will build and tag a new image. |
| `ports` | List | **Supported.** A list of port mappings (e.g., `"8080:8080"`). This is primarily used to determine the ingress container. See "Ingress Container Selection" below. |
| `expose` | List | **Supported.** A list of ports to expose but not publish (e.g., `"3000"`). This is used to ensure dependent services have a port available for communication. |
| `depends_on` | List | **Supported.** Defines the startup order for containers. `run-compose` ensures that any service listed in `depends_on` has a port defined (either via `ports` or `expose`) so that other containers can communicate with it. |
| `cpu_count` / `cpus` | Number | **Supported.** Used as a hint to set Cloud Run CPU and Memory limits. The tool reads this value and automatically allocates resources according to the following logic: \- \*\*\<= 2 CPU:\*\* 1Gi Memory \- \*\*\<= 4 CPU:\*\* 2Gi Memory \- \*\*\> 4 CPU:\*\* 4Gi Memory |
| `volumes` | List | **Partially Supported.** The tool translates `bind`, `volume`, and `tmpfs` mounts into cloud-run equivalents. |
| `container_name` | String | **Supported.** If specified, this name is used for the container within the Cloud Run service, particularly for dependency resolution. If not provided, the service name is used. |
| `environment` | List or Map | **Supported.** Environment variables are passed directly to the corresponding container in Cloud Run. |

### Custom Extensions

`run-compose` uses custom extensions (`x-...`) to manage Cloud Run-specific settings.

| Key | Type | Description |
| :---- | :---- | :---- |
| `x-google-cloudrun-ingress-container` | Boolean | **Supported.** Add this extension to a service and set it to `true` to explicitly mark it as the ingress container that receives all external traffic. |

## Ingress Container Selection Logic

Cloud Run requires a single container to be designated as the ingress (entry point) for external traffic.  The ingress container is determined using the following order of precedence:

1. **Explicit Extension:** The service with the extension `x-google-cloudrun-ingress-container: true`.
2. **Port 8080:** If no extension is found, the first service that publishes port `8080` is chosen.
3. **Any Published Port:** If no service uses port 8080, the first service with *any* published port is chosen.
4. **First Service:** If no service has a published port, the first service defined in the `compose.yaml` file is chosen as the ingress, and it will be assigned port 8080\.


#

##



