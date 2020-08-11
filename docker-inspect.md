
### 执行 docker inspect 命令后打印信息参考

- https://github.com/moby/moby/blob/master/image/image.go
- [Package template - docker's src Golang 中使用](https://golang.org/pkg/text/template/)
```golang
type V1Image struct {
	// ID is a unique 64 character identifier of the image
	ID string `json:"id,omitempty"`
	// Parent is the ID of the parent image
	Parent string `json:"parent,omitempty"`
	// Comment is the commit message that was set when committing the image
	Comment string `json:"comment,omitempty"`
	// Created is the timestamp at which the image was created
	Created time.Time `json:"created"`
	// Container is the id of the container used to commit
	Container string `json:"container,omitempty"`
	// ContainerConfig is the configuration of the container that is committed into the image
	ContainerConfig container.Config `json:"container_config,omitempty"`
	// DockerVersion specifies the version of Docker that was used to build the image
	DockerVersion string `json:"docker_version,omitempty"`
	// Author is the name of the author that was specified when committing the image
	Author string `json:"author,omitempty"`
	// Config is the configuration of the container received from the client
	Config *container.Config `json:"config,omitempty"`
	// Architecture is the hardware that the image is built and runs on
	Architecture string `json:"architecture,omitempty"`
	// Variant is the CPU architecture variant (presently ARM-only)
	Variant string `json:"variant,omitempty"`
	// OS is the operating system used to build and run the image
	OS string `json:"os,omitempty"`
	// Size is the total size of the image including all layers it is composed of
	Size int64 `json:",omitempty"`
}
```


### 以下是Image比较(docker inspect <ImageId>)
- hello-world
```javascript
[
    {
        "Id": "sha256:bf756fb1ae65adf866bd8c456593cd24beb6a0a061dedf42b26a993176745f6b",
        "RepoTags": [
            "hello-world:latest"
        ],
        "RepoDigests": [
            "hello-world@sha256:49a1c8800c94df04e9658809b006fd8a686cab8028d33cfba2cc049724254202"
        ],
        "Parent": "",
        "Comment": "",
        "Created": "2020-01-03T01:21:37.263809283Z",
        "Container": "71237a2659e6419aee44fc0b51ffbd12859d1a50ba202e02c2586ed999def583",
        "ContainerConfig": {
            "Hostname": "71237a2659e6",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "#(nop) ",
                "CMD [\"/hello\"]"
            ],
            "ArgsEscaped": true,
            "Image": "sha256:eb850c6a1aedb3d5c62c3a484ff01b6b4aade130b950e3bf3e9c016f17f70c34",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {}
        },
        "DockerVersion": "18.06.1-ce",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/hello"
            ],
            "ArgsEscaped": true,
            "Image": "sha256:eb850c6a1aedb3d5c62c3a484ff01b6b4aade130b950e3bf3e9c016f17f70c34",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": null
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 13336,
        "VirtualSize": 13336,
        "GraphDriver": {
            "Data": {
                "MergedDir": "/var/lib/docker/overlay2/3c621c78ab7cb52ebb484f156e779e6b7dfdccc0474779721f8a8b2b0bafc373/merged",
                "UpperDir": "/var/lib/docker/overlay2/3c621c78ab7cb52ebb484f156e779e6b7dfdccc0474779721f8a8b2b0bafc373/diff",
                "WorkDir": "/var/lib/docker/overlay2/3c621c78ab7cb52ebb484f156e779e6b7dfdccc0474779721f8a8b2b0bafc373/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:9c27e219663c25e0f28493790cc0b88bc973ba3b1686355f221c38a36978ac63"
            ]
        },
        "Metadata": {
            "LastTagTime": "0001-01-01T00:00:00Z"
        }
    }
]
```

- busybox
```javascript
[
    {
        "Id": "sha256:018c9d7b792b4be80095d957533667279843acf9a46c973067c8d1dff31ea8b4",
        "RepoTags": [
            "busybox:latest"
        ],
        "RepoDigests": [
            "busybox@sha256:4f47c01fa91355af2865ac10fef5bf6ec9c7f42ad2321377c21e844427972977"
        ],
        "Parent": "",
        "Comment": "",
        "Created": "2020-07-28T00:19:37.054023596Z",
        "Container": "7a2ed54cb11ef1f3c68f65b742e8a825aa0fdbf634b319592b2f97e032b1a35c",
        "ContainerConfig": {
            "Hostname": "7a2ed54cb11e",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "#(nop) ",
                "CMD [\"sh\"]"
            ],
            "ArgsEscaped": true,
            "Image": "sha256:2ed2c80f6a520f2a854b1cbe5dd6c4bc79e35a66d9c10cb00954ad4d41e7af74",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {}
        },
        "DockerVersion": "18.09.7",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "sh"
            ],
            "ArgsEscaped": true,
            "Image": "sha256:2ed2c80f6a520f2a854b1cbe5dd6c4bc79e35a66d9c10cb00954ad4d41e7af74",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": null
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 1223534,
        "VirtualSize": 1223534,
        "GraphDriver": {
            "Data": {
                "MergedDir": "/var/lib/docker/overlay2/4e2dce0e8bba2c68446fd08bc65aa53293fa316c01a45aa391f8075bf40abe4d/merged",
                "UpperDir": "/var/lib/docker/overlay2/4e2dce0e8bba2c68446fd08bc65aa53293fa316c01a45aa391f8075bf40abe4d/diff",
                "WorkDir": "/var/lib/docker/overlay2/4e2dce0e8bba2c68446fd08bc65aa53293fa316c01a45aa391f8075bf40abe4d/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:514c3a3e64d4ebf15f482c9e8909d130bcd53bcc452f0225b0a04744de7b8c43"
            ]
        },
        "Metadata": {
            "LastTagTime": "0001-01-01T00:00:00Z"
        }
    }
]
```

- alpine
```javascript
[
    {
        "Id": "sha256:a24bb4013296f61e89ba57005a7b3e52274d8edd3ae2077d04395f806b63d83e",
        "RepoTags": [
            "alpine:latest"
        ],
        "RepoDigests": [
            "alpine@sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321"
        ],
        "Parent": "",
        "Comment": "",
        "Created": "2020-05-29T21:19:46.363518345Z",
        "Container": "ce1874fa1fc1eb128516899352f185645f492c443b5a80d9a3fae8b09d1b6b16",
        "ContainerConfig": {
            "Hostname": "ce1874fa1fc1",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "#(nop) ",
                "CMD [\"/bin/sh\"]"
            ],
            "ArgsEscaped": true,
            "Image": "sha256:64771e4514cb653a0fe68e1ceed5bd16640ebf3bd859dc3333efe87dc4709a5d",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {}
        },
        "DockerVersion": "18.09.7",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh"
            ],
            "ArgsEscaped": true,
            "Image": "sha256:64771e4514cb653a0fe68e1ceed5bd16640ebf3bd859dc3333efe87dc4709a5d",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": null
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 5574537,
        "VirtualSize": 5574537,
        "GraphDriver": {
            "Data": {
                "MergedDir": "/var/lib/docker/overlay2/92dbcb0e55e28dd7637f728dc5b403cea63dbb32ea889eb4d2e4fe4b1e879bc2/merged",
                "UpperDir": "/var/lib/docker/overlay2/92dbcb0e55e28dd7637f728dc5b403cea63dbb32ea889eb4d2e4fe4b1e879bc2/diff",
                "WorkDir": "/var/lib/docker/overlay2/92dbcb0e55e28dd7637f728dc5b403cea63dbb32ea889eb4d2e4fe4b1e879bc2/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:50644c29ef5a27c9a40c393a73ece2479de78325cae7d762ef3cdc19bf42dd0a"
            ]
        },
        "Metadata": {
            "LastTagTime": "0001-01-01T00:00:00Z"
        }
    }
]
```

