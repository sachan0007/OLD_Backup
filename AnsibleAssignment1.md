* Use ansible to list out files & folders in */tmp* directory.
* Install python on target machine using ansible.
* Use ansible to Create a *user ninja*
* Use ansible to create a file */tmp/ninja.txt* using ninja user.
* Change your default execution from *command* to *ping*.
* Fetch and display to STDOUT Ansible facts using the `setup` module.
* Fetch and display only the "virtual" subset of facts for each host.
* Fetch and display the value of fully qualified domain name (FQDN) of each host from their Ansible facts.  
----------------------------------------------------------------------------------------------------------------  
**Task: Use ansible to list out files & folders in */tmp* directory.**  
ansible -m find -a "path=/tmp recurse=no file_type=any get_checksum=yes" host2  





**Task: Install python on target machine using ansible.**  
Ad-Hoc command: ansible -m package -a "name=python state=present" host2  

Console output:  
```
[root@ip-172-31-22-206 ec2-user]# ansible -m package -a "name=python state=present" host2  
host2 | SUCCESS => {
    "changed": false,
    "failed": false,
    "msg": "",
    "rc": 0,
    "results": [
        "python-2.7.14-58.amzn2.0.4.x86_64 providing python is already installed"  
    ]
}
```
**Task: Use ansible to Create a 'user ninja'**  
Ad-Hoc command: ansible -m user -a "name=ninja comment=Abhishek_ninja group=root shell=/bin/bash" host2 -b  
                ansible -m copy -a "src=/root/.ssh/id_rsa.pub dest=/home/ninja/.ssh/authorized_keys" host2 -b
Console Output:  
```
[root@ip-172-31-22-206 ec2-user]# ansible -m user -a "name=ninja comment=Abhishek_ninja group=root shell=/bin/bash" host2 -b
host2 | SUCCESS => {
    "changed": true,
    "comment": "Abhishek_ninja",
    "createhome": true,
    "failed": false,
    "group": 0,
    "home": "/home/ninja",
    "name": "ninja",
    "shell": "/bin/bash",
    "state": "present",
    "system": false,
    "uid": 1011
}
```
**Task: Use ansible to create a file */tmp/ninja.txt* using ninja user.**   
Update ansible host file  
```
[appserver]
host2 ansible_host=13.126.138.153

[appserver:vars]
ansible_ssh_user=ninja
ansible_ssh_private_key_file=/root/.ssh/id_rsa
ansible_port=22
```
create file now:  
Ad-hock command: ansible -m file -a "path=/tmp/ninja.txt state=touch mode=u+rw,g-wx,o-rwx owner=ninja group=root" host2  

Console output:  
```
[root@ip-172-31-22-206 .ssh]# ansible -m file -a "path=/tmp/ninja.txt state=touch mode=u+rw,g-wx,o-rwx owner=ninja group=root" host2
host2 | SUCCESS => {
    "changed": true,
    "dest": "/tmp/ninja.txt",
    "failed": false,
    "gid": 0,
    "group": "root",
    "mode": "0640",
    "owner": "ninja",
    "size": 0,
    "state": "file",
    "uid": 1011
}
```
**Task: Change your default execution from 'command' to 'ping'.**  
Update ansible.cfg  
>module_name = ping  
Console output:  
```
[root@ip-172-31-22-206 ec2-user]# ansible host2
host2 | SUCCESS => {
    "changed": false,
    "failed": false,
    "ping": "pong"
}
```
**Task: Fetch and display to STDOUT Ansible facts using the `setup` module**  
Ad-hoc command: ansible -m setup host2  
Console ouput:  
```
host2 | SUCCESS => {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "172.31.13.124"
        ],
        "ansible_all_ipv6_addresses": [
            "fe80::89b:82ff:fe9d:b768"
        ],
        "ansible_apparmor": {
            "status": "disabled"
        },
        "ansible_architecture": "x86_64",
        "ansible_bios_date": "08/24/2006",
        "ansible_bios_version": "4.2.amazon",
        "ansible_cmdline": {
            "BOOT_IMAGE": "/boot/vmlinuz-4.14.128-112.105.amzn2.x86_64",
            "KEYTABLE": "us",
            "LANG": "en_US.UTF-8",
            "biosdevname": "0",
            "console": "ttyS0,115200n8",
            "net.ifnames": "0",
            "nvme_core.io_timeout": "4294967295",
            "rd.emergency": "poweroff",
            "rd.shell": "0",
            "ro": true,
            "root": "UUID=a1e1011e-e38f-408e-878b-fed395b47ad6"
        },
        "ansible_date_time": {
            "date": "2019-07-08",
            "day": "08",
            "epoch": "1562601335",
            "hour": "15",
            "iso8601": "2019-07-08T15:55:35Z",
            "iso8601_basic": "20190708T155535899615",
            "iso8601_basic_short": "20190708T155535",
            "iso8601_micro": "2019-07-08T15:55:35.899682Z",
            "minute": "55",
            "month": "07",
            "second": "35",
            "time": "15:55:35",
            "tz": "UTC",
            "tz_offset": "+0000",
            "weekday": "Monday",
            "weekday_number": "1",
            "weeknumber": "27",
            "year": "2019"
        },
        "ansible_default_ipv4": {
            "address": "172.31.13.124",
            "alias": "eth0",
            "broadcast": "172.31.15.255",
            "gateway": "172.31.0.1",
            "interface": "eth0",
            "macaddress": "0a:9b:82:9d:b7:68",
            "mtu": 9001,
            "netmask": "255.255.240.0",
            "network": "172.31.0.0",
            "type": "ether"
        },
        "ansible_default_ipv6": {},
        "ansible_device_links": {
            "ids": {},
            "labels": {
                "xvda1": [
                    "\\x2f"
                ]
            },
            "masters": {},
            "uuids": {
                "xvda1": [
                    "a1e1011e-e38f-408e-878b-fed395b47ad6"
                ]
            }
        },
        "ansible_devices": {
            "xvda": {
                "holders": [],
                "host": "",
                "links": {
                    "ids": [],
                    "labels": [],
                    "masters": [],
                    "uuids": []
                },
                "model": null,
                "partitions": {
                    "xvda1": {
                        "holders": [],
                        "links": {
                            "ids": [],
                            "labels": [
                                "\\x2f"
                            ],
                            "masters": [],
                            "uuids": [
                                "a1e1011e-e38f-408e-878b-fed395b47ad6"
                            ]
                        },
                        "sectors": "16773087",
                        "sectorsize": 512,
                        "size": "8.00 GB",
                        "start": "4096",
                        "uuid": "a1e1011e-e38f-408e-878b-fed395b47ad6"
                    }
                },
                "removable": "0",
                "rotational": "0",
                "sas_address": null,
                "sas_device_handle": null,
                "scheduler_mode": "noop",
                "sectors": "16777216",
                "sectorsize": "512",
                "size": "8.00 GB",
                "support_discard": "0",
                "vendor": null,
                "virtual": 1
            }
        },
        "ansible_distribution": "Amazon",
        "ansible_distribution_file_parsed": true,
        "ansible_distribution_file_path": "/etc/system-release",
        "ansible_distribution_file_variety": "Amazon",
        "ansible_distribution_major_version": "NA",
        "ansible_distribution_release": "NA",
        "ansible_distribution_version": "(Karoo)",
        "ansible_dns": {
            "nameservers": [
                "172.31.0.2"
            ],
            "options": {
                "attempts": "5",
                "timeout": "2"
            },
            "search": [
                "ap-south-1.compute.internal"
            ]
        },
        "ansible_domain": "ap-south-1.compute.internal",
        "ansible_effective_group_id": 1000,
        "ansible_effective_user_id": 1000,
        "ansible_env": {
            "HOME": "/home/ec2-user",
            "JAVA_HOME": "/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.201.b09-0.amzn2.x86_64",
            "LANG": "en_US.UTF-8",
            "LESSOPEN": "||/usr/bin/lesspipe.sh %s",
            "LOGNAME": "ec2-user",
            "LS_COLORS": "rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=01;36:*.au=01;36:*.flac=01;36:*.mid=01;36:*.midi=01;36:*.mka=01;36:*.mp3=01;36:*.mpc=01;36:*.ogg=01;36:*.ra=01;36:*.wav=01;36:*.axa=01;36:*.oga=01;36:*.spx=01;36:*.xspf=01;36:",
            "MAIL": "/var/mail/ec2-user",
            "PATH": "/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.201.b09-0.amzn2.x86_64/bin:/usr/local/bin:/usr/bin",
            "PWD": "/home/ec2-user",
            "SHELL": "/bin/bash",
            "SHLVL": "2",
            "SSH_CLIENT": "13.235.19.79 34416 22",
            "SSH_CONNECTION": "13.235.19.79 34416 172.31.13.124 22",
            "SSH_TTY": "/dev/pts/0",
            "TERM": "xterm",
            "USER": "ec2-user",
            "XDG_RUNTIME_DIR": "/run/user/1000",
            "XDG_SESSION_ID": "13",
            "_": "/usr/bin/python"
        },
        "ansible_eth0": {
            "active": true,
            "device": "eth0",
            "features": {
                "esp_hw_offload": "off [fixed]",
                "esp_tx_csum_hw_offload": "off [fixed]",
                "fcoe_mtu": "off [fixed]",
                "generic_receive_offload": "on",
                "generic_segmentation_offload": "on",
                "highdma": "off [fixed]",
                "hw_tc_offload": "off [fixed]",
                "l2_fwd_offload": "off [fixed]",
                "large_receive_offload": "off [fixed]",
                "loopback": "off [fixed]",
                "netns_local": "off [fixed]",
                "ntuple_filters": "off [fixed]",
                "receive_hashing": "off [fixed]",
                "rx_all": "off [fixed]",
                "rx_checksumming": "on [fixed]",
                "rx_fcs": "off [fixed]",
                "rx_udp_tunnel_port_offload": "off [fixed]",
                "rx_vlan_filter": "off [fixed]",
                "rx_vlan_offload": "off [fixed]",
                "rx_vlan_stag_filter": "off [fixed]",
                "rx_vlan_stag_hw_parse": "off [fixed]",
                "scatter_gather": "on",
                "tcp_segmentation_offload": "on",
                "tx_checksum_fcoe_crc": "off [fixed]",
                "tx_checksum_ip_generic": "off [fixed]",
                "tx_checksum_ipv4": "on [fixed]",
                "tx_checksum_ipv6": "off [requested on]",
                "tx_checksum_sctp": "off [fixed]",
                "tx_checksumming": "on",
                "tx_esp_segmentation": "off [fixed]",
                "tx_fcoe_segmentation": "off [fixed]",
                "tx_gre_csum_segmentation": "off [fixed]",
                "tx_gre_segmentation": "off [fixed]",
                "tx_gso_partial": "off [fixed]",
                "tx_gso_robust": "on [fixed]",
                "tx_ipxip4_segmentation": "off [fixed]",
                "tx_ipxip6_segmentation": "off [fixed]",
                "tx_lockless": "off [fixed]",
                "tx_nocache_copy": "off",
                "tx_scatter_gather": "on",
                "tx_scatter_gather_fraglist": "off [fixed]",
                "tx_sctp_segmentation": "off [fixed]",
                "tx_tcp6_segmentation": "off [requested on]",
                "tx_tcp_ecn_segmentation": "off [fixed]",
                "tx_tcp_mangleid_segmentation": "off",
                "tx_tcp_segmentation": "on",
                "tx_udp_tnl_csum_segmentation": "off [fixed]",
                "tx_udp_tnl_segmentation": "off [fixed]",
                "tx_vlan_offload": "off [fixed]",
                "tx_vlan_stag_hw_insert": "off [fixed]",
                "udp_fragmentation_offload": "off",
                "vlan_challenged": "off [fixed]"
            },
            "hw_timestamp_filters": [],
            "ipv4": {
                "address": "172.31.13.124",
                "broadcast": "172.31.15.255",
                "netmask": "255.255.240.0",
                "network": "172.31.0.0"
            },
            "ipv6": [
                {
                    "address": "fe80::89b:82ff:fe9d:b768",
                    "prefix": "64",
                    "scope": "link"
                }
            ],
            "macaddress": "0a:9b:82:9d:b7:68",
            "module": "xen_netfront",
            "mtu": 9001,
            "pciid": "vif-0",
            "promisc": false,
            "timestamping": [
                "rx_software",
                "software"
            ],
            "type": "ether"
        },
        "ansible_fips": false,
        "ansible_form_factor": "Other",
        "ansible_fqdn": "ip-172-31-13-124.ap-south-1.compute.internal",
        "ansible_hostname": "ip-172-31-13-124",
        "ansible_interfaces": [
            "lo",
            "eth0"
        ],
        "ansible_kernel": "4.14.128-112.105.amzn2.x86_64",
        "ansible_lo": {
            "active": true,
            "device": "lo",
            "features": {
                "esp_hw_offload": "off [fixed]",
                "esp_tx_csum_hw_offload": "off [fixed]",
                "fcoe_mtu": "off [fixed]",
                "generic_receive_offload": "on",
                "generic_segmentation_offload": "on",
                "highdma": "on [fixed]",
                "hw_tc_offload": "off [fixed]",
                "l2_fwd_offload": "off [fixed]",
                "large_receive_offload": "off [fixed]",
                "loopback": "on [fixed]",
                "netns_local": "on [fixed]",
                "ntuple_filters": "off [fixed]",
                "receive_hashing": "off [fixed]",
                "rx_all": "off [fixed]",
                "rx_checksumming": "on [fixed]",
                "rx_fcs": "off [fixed]",
                "rx_udp_tunnel_port_offload": "off [fixed]",
                "rx_vlan_filter": "off [fixed]",
                "rx_vlan_offload": "off [fixed]",
                "rx_vlan_stag_filter": "off [fixed]",
                "rx_vlan_stag_hw_parse": "off [fixed]",
                "scatter_gather": "on",
                "tcp_segmentation_offload": "on",
                "tx_checksum_fcoe_crc": "off [fixed]",
                "tx_checksum_ip_generic": "on [fixed]",
                "tx_checksum_ipv4": "off [fixed]",
                "tx_checksum_ipv6": "off [fixed]",
                "tx_checksum_sctp": "on [fixed]",
                "tx_checksumming": "on",
                "tx_esp_segmentation": "off [fixed]",
                "tx_fcoe_segmentation": "off [fixed]",
                "tx_gre_csum_segmentation": "off [fixed]",
                "tx_gre_segmentation": "off [fixed]",
                "tx_gso_partial": "off [fixed]",
                "tx_gso_robust": "off [fixed]",
                "tx_ipxip4_segmentation": "off [fixed]",
                "tx_ipxip6_segmentation": "off [fixed]",
                "tx_lockless": "on [fixed]",
                "tx_nocache_copy": "off [fixed]",
                "tx_scatter_gather": "on [fixed]",
                "tx_scatter_gather_fraglist": "on [fixed]",
                "tx_sctp_segmentation": "on",
                "tx_tcp6_segmentation": "on",
                "tx_tcp_ecn_segmentation": "on",
                "tx_tcp_mangleid_segmentation": "on",
                "tx_tcp_segmentation": "on",
                "tx_udp_tnl_csum_segmentation": "off [fixed]",
                "tx_udp_tnl_segmentation": "off [fixed]",
                "tx_vlan_offload": "off [fixed]",
                "tx_vlan_stag_hw_insert": "off [fixed]",
                "udp_fragmentation_offload": "off",
                "vlan_challenged": "on [fixed]"
            },
            "hw_timestamp_filters": [],
            "ipv4": {
                "address": "127.0.0.1",
                "broadcast": "host",
                "netmask": "255.0.0.0",
                "network": "127.0.0.0"
            },
            "ipv6": [
                {
                    "address": "::1",
                    "prefix": "128",
                    "scope": "host"
                }
            ],
            "mtu": 65536,
            "promisc": false,
            "timestamping": [
                "tx_software",
                "rx_software",
                "software"
            ],
            "type": "loopback"
        },
        "ansible_local": {},
        "ansible_lsb": {},
        "ansible_machine": "x86_64",
        "ansible_machine_id": "ded64cbff86f478990a3dfbb63a8d238",
        "ansible_memfree_mb": 709,
        "ansible_memory_mb": {
            "nocache": {
                "free": 892,
                "used": 91
            },
            "real": {
                "free": 709,
                "total": 983,
                "used": 274
            },
            "swap": {
                "cached": 0,
                "free": 0,
                "total": 0,
                "used": 0
            }
        },
        "ansible_memtotal_mb": 983,
        "ansible_mounts": [
            {
                "block_available": 1566517,
                "block_size": 4096,
                "block_total": 2094075,
                "block_used": 527558,
                "device": "/dev/xvda1",
                "fstype": "xfs",
                "inode_available": 4135671,
                "inode_total": 4193216,
                "inode_used": 57545,
                "mount": "/",
                "options": "rw,noatime,attr2,inode64,noquota",
                "size_available": 6416453632,
                "size_total": 8577331200,
                "uuid": "a1e1011e-e38f-408e-878b-fed395b47ad6"
            }
        ],
        "ansible_nodename": "ip-172-31-13-124.ap-south-1.compute.internal",
        "ansible_os_family": "RedHat",
        "ansible_pkg_mgr": "yum",
        "ansible_processor": [
            "0",
            "GenuineIntel",
            "Intel(R) Xeon(R) CPU E5-2676 v3 @ 2.40GHz"
        ],
        "ansible_processor_cores": 1,
        "ansible_processor_count": 1,
        "ansible_processor_threads_per_core": 1,
        "ansible_processor_vcpus": 1,
        "ansible_product_name": "HVM domU",
        "ansible_product_serial": "NA",
        "ansible_product_uuid": "NA",
        "ansible_product_version": "4.2.amazon",
        "ansible_python": {
            "executable": "/usr/bin/python",
            "has_sslcontext": true,
            "type": "CPython",
            "version": {
                "major": 2,
                "micro": 16,
                "minor": 7,
                "releaselevel": "final",
                "serial": 0
            },
            "version_info": [
                2,
                7,
                16,
                "final",
                0
            ]
        },
        "ansible_python_version": "2.7.16",
        "ansible_real_group_id": 1000,
        "ansible_real_user_id": 1000,
        "ansible_selinux": {
            "status": "Missing selinux Python library"
        },
        "ansible_selinux_python_present": false,
        "ansible_service_mgr": "systemd",
        "ansible_ssh_host_key_ecdsa_public": "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEoFoEeK/24bFHR2dF7JABzwTllLVDrbqOdf6fgJZtNFrKE8QRY7Y3UJzNOERiEwwI21q6r0g8rshOYNrj8g69A=",
        "ansible_ssh_host_key_ed25519_public": "AAAAC3NzaC1lZDI1NTE5AAAAIIdyfuRDMqS3hfuerXwHLpvokXY3ANPL2Nwph9S3/38D",
        "ansible_ssh_host_key_rsa_public": "AAAAB3NzaC1yc2EAAAADAQABAAABAQCYFMZhd4pF48rDuwJrdjcioxYHPZM912fNEKHJ/9HY+LfgXauFo1YC1NFnG2MaBhPZX6YuS2nb1SdKq19dxdIiCsh5ZMNJRxTl1/2EzzFWqXxtu0OaFQxTP3PL0uhbDigMB9wILorkBlApHJY7Wft0C5txoxDr1WXUmUOHYgT8CXdFCtOfi+sGmEPX25a2qFjWuRvPY3h59UQ0Nw1Gnwb9GzkluMcJcXt8iGB2ANjFTwNhWdIdZYi5vSYM86MLCmH5bsp2dsbjpdB4k13s2ZTElpDvJ/UGCdtW4DTA20KCURSz2i+zPmo2QxMDo+E2b8k2lGpr6Aaq8qsVwo7mzBNN",
        "ansible_swapfree_mb": 0,
        "ansible_swaptotal_mb": 0,
        "ansible_system": "Linux",
        "ansible_system_capabilities": [
            ""
        ],
        "ansible_system_capabilities_enforced": "True",
        "ansible_system_vendor": "Xen",
        "ansible_uptime_seconds": 5209,
        "ansible_user_dir": "/home/ec2-user",
        "ansible_user_gecos": "EC2 Default User",
        "ansible_user_gid": 1000,
        "ansible_user_id": "ec2-user",
        "ansible_user_shell": "/bin/bash",
        "ansible_user_uid": 1000,
        "ansible_userspace_architecture": "x86_64",
        "ansible_userspace_bits": "64",
        "ansible_virtualization_role": "guest",
        "ansible_virtualization_type": "xen",
        "gather_subset": [
            "all"
        ],
        "module_setup": true
    },
    "changed": false,
    "failed": false
}
```
**Task: Fetch and display only the "virtual" subset of facts for each host**  
Ad-hoc command: ansible -m setup -a "gather_subset=virtual" host2  
Console output:  
```
host2 | SUCCESS => {
    "ansible_facts": {
        "ansible_apparmor": {
            "status": "disabled"
        },
        "ansible_architecture": "x86_64",
        "ansible_cmdline": {
            "BOOT_IMAGE": "/boot/vmlinuz-4.14.128-112.105.amzn2.x86_64",
            "KEYTABLE": "us",
            "LANG": "en_US.UTF-8",
            "biosdevname": "0",
            "console": "ttyS0,115200n8",
            "net.ifnames": "0",
            "nvme_core.io_timeout": "4294967295",
            "rd.emergency": "poweroff",
            "rd.shell": "0",
            "ro": true,
            "root": "UUID=a1e1011e-e38f-408e-878b-fed395b47ad6"
        },
        "ansible_date_time": {
            "date": "2019-07-08",
            "day": "08",
            "epoch": "1562601794",
            "hour": "16",
            "iso8601": "2019-07-08T16:03:14Z",
            "iso8601_basic": "20190708T160314033529",
            "iso8601_basic_short": "20190708T160314",
            "iso8601_micro": "2019-07-08T16:03:14.033602Z",
            "minute": "03",
            "month": "07",
            "second": "14",
            "time": "16:03:14",
            "tz": "UTC",
            "tz_offset": "+0000",
            "weekday": "Monday",
            "weekday_number": "1",
            "weeknumber": "27",
            "year": "2019"
        },
        "ansible_distribution": "Amazon",
        "ansible_distribution_file_parsed": true,
        "ansible_distribution_file_path": "/etc/system-release",
        "ansible_distribution_file_variety": "Amazon",
        "ansible_distribution_major_version": "NA",
        "ansible_distribution_release": "NA",
        "ansible_distribution_version": "(Karoo)",
        "ansible_dns": {
            "nameservers": [
                "172.31.0.2"
            ],
            "options": {
                "attempts": "5",
                "timeout": "2"
            },
            "search": [
                "ap-south-1.compute.internal"
            ]
        },
        "ansible_domain": "ap-south-1.compute.internal",
        "ansible_effective_group_id": 1000,
        "ansible_effective_user_id": 1000,
        "ansible_env": {
            "HOME": "/home/ec2-user",
            "JAVA_HOME": "/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.201.b09-0.amzn2.x86_64",
            "LANG": "en_US.UTF-8",
            "LESSOPEN": "||/usr/bin/lesspipe.sh %s",
            "LOGNAME": "ec2-user",
            "LS_COLORS": "rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=01;36:*.au=01;36:*.flac=01;36:*.mid=01;36:*.midi=01;36:*.mka=01;36:*.mp3=01;36:*.mpc=01;36:*.ogg=01;36:*.ra=01;36:*.wav=01;36:*.axa=01;36:*.oga=01;36:*.spx=01;36:*.xspf=01;36:",
            "MAIL": "/var/mail/ec2-user",
            "PATH": "/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.201.b09-0.amzn2.x86_64/bin:/usr/local/bin:/usr/bin",
            "PWD": "/home/ec2-user",
            "SHELL": "/bin/bash",
            "SHLVL": "2",
            "SSH_CLIENT": "13.235.19.79 34420 22",
            "SSH_CONNECTION": "13.235.19.79 34420 172.31.13.124 22",
            "SSH_TTY": "/dev/pts/0",
            "TERM": "xterm",
            "USER": "ec2-user",
            "XDG_RUNTIME_DIR": "/run/user/1000",
            "XDG_SESSION_ID": "17",
            "_": "/usr/bin/python"
        },
        "ansible_fips": false,
        "ansible_fqdn": "ip-172-31-13-124.ap-south-1.compute.internal",
        "ansible_hostname": "ip-172-31-13-124",
        "ansible_kernel": "4.14.128-112.105.amzn2.x86_64",
        "ansible_local": {},
        "ansible_lsb": {},
        "ansible_machine": "x86_64",
        "ansible_machine_id": "ded64cbff86f478990a3dfbb63a8d238",
        "ansible_nodename": "ip-172-31-13-124.ap-south-1.compute.internal",
        "ansible_os_family": "RedHat",
        "ansible_pkg_mgr": "yum",
        "ansible_python": {
            "executable": "/usr/bin/python",
            "has_sslcontext": true,
            "type": "CPython",
            "version": {
                "major": 2,
                "micro": 16,
                "minor": 7,
                "releaselevel": "final",
                "serial": 0
            },
            "version_info": [
                2,
                7,
                16,
                "final",
                0
            ]
        },
        "ansible_python_version": "2.7.16",
        "ansible_real_group_id": 1000,
        "ansible_real_user_id": 1000,
        "ansible_selinux": {
            "status": "Missing selinux Python library"
        },
        "ansible_selinux_python_present": false,
        "ansible_service_mgr": "systemd",
        "ansible_ssh_host_key_ecdsa_public": "AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEoFoEeK/24bFHR2dF7JABzwTllLVDrbqOdf6fgJZtNFrKE8QRY7Y3UJzNOERiEwwI21q6r0g8rshOYNrj8g69A=",
        "ansible_ssh_host_key_ed25519_public": "AAAAC3NzaC1lZDI1NTE5AAAAIIdyfuRDMqS3hfuerXwHLpvokXY3ANPL2Nwph9S3/38D",
        "ansible_ssh_host_key_rsa_public": "AAAAB3NzaC1yc2EAAAADAQABAAABAQCYFMZhd4pF48rDuwJrdjcioxYHPZM912fNEKHJ/9HY+LfgXauFo1YC1NFnG2MaBhPZX6YuS2nb1SdKq19dxdIiCsh5ZMNJRxTl1/2EzzFWqXxtu0OaFQxTP3PL0uhbDigMB9wILorkBlApHJY7Wft0C5txoxDr1WXUmUOHYgT8CXdFCtOfi+sGmEPX25a2qFjWuRvPY3h59UQ0Nw1Gnwb9GzkluMcJcXt8iGB2ANjFTwNhWdIdZYi5vSYM86MLCmH5bsp2dsbjpdB4k13s2ZTElpDvJ/UGCdtW4DTA20KCURSz2i+zPmo2QxMDo+E2b8k2lGpr6Aaq8qsVwo7mzBNN",
        "ansible_system": "Linux",
        "ansible_system_capabilities": [
            ""
        ],
        "ansible_system_capabilities_enforced": "True",
        "ansible_user_dir": "/home/ec2-user",
        "ansible_user_gecos": "EC2 Default User",
        "ansible_user_gid": 1000,
        "ansible_user_id": "ec2-user",
        "ansible_user_shell": "/bin/bash",
        "ansible_user_uid": 1000,
        "ansible_userspace_architecture": "x86_64",
        "ansible_userspace_bits": "64",
        "ansible_virtualization_role": "guest",
        "ansible_virtualization_type": "xen",
        "gather_subset": [
            "virtual"
        ],
        "module_setup": true
    },
    "changed": false,
    "failed": false
}
```
**Task: Fetch and display the value of fully qualified domain name (FQDN) of each host from their Ansible facts**  
Ad-hoc command: ansible -m setup -a "filter=ansible_fqdn" host2  
Console output:  
```
host2 | SUCCESS => {
    "ansible_facts": {
        "ansible_fqdn": "ip-172-31-13-124.ap-south-1.compute.internal"
    },
    "changed": false,
    "failed": false
}
```

