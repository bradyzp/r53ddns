DNSUpdater
==========

A simple command-line utility used to update an AWS Route 53 DNS entry with the
current public IP Address of the executing host. Used to maintain DNS records
which point to a dynamic address.

Installation
------------

Requirements:

- Python >= 3.6.x

Using venv & pip
^^^^^^^^^^^^^^^^

.. code-block::

    python3 -m venv venv
    source venv/bin/activate
    pip install dnsupdater

Installation as a daemon using Systemd
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Create/install systemd service and timer unit files.
.timer will execute the .service file periodically upon boot of the OS, and
every 5 minutes thereafter.

.. code-block::

    [Unit]
    Description=
    After=network.target

    [Service]
    Type=oneshot
    User=awsuser
    Environment="PATH=/opt/dnsupdater/venv/bin"
    ExecStart=/opt/dnsupdater/venv/bin/dnsupdater

    [Install]
    WantedBy=network.target


.. code-block::
    [Unit]
    Description=Run DNSUpdater periodically

    [Timer]
    OnBootSec=1min
    OnUnitActiveSec=5min

    [Install]
    WantedBy=timers.target