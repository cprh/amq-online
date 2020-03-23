set -x

AMQ_ONLINE_INFRA_PROJ=amq-online-infra
HOST_NAME=fuse-local-console.apps-crc.testing


wget https://access.redhat.com/node/4541981/423/0/15323281 -O amq-online-install-1-3.zip

unzip ./amq-online-install-1-3.zip -d amq-online-install-1-3


output=$(oc get project ${AMQ_ONLINE_INFRA_PROJ})

if [ -z "${output}" ]; then
    echo "project doesn't exists." 
    oc new-project ${AMQ_ONLINE_INFRA_PROJ}
fi

echo "Proceeding"

oc apply -f ./amq-online.yaml

cd amq-online-install-1-3

oc apply -f install/components/example-plans -n ${AMQ_ONLINE_INFRA_PROJ}
oc apply -f install/components/example-roles -n ${AMQ_ONLINE_INFRA_PROJ}
oc apply -f install/components/example-authservices/standard-authservice.yaml -n ${AMQ_ONLINE_INFRA_PROJ}





 


