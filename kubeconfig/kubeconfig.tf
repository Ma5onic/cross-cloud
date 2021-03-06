resource "null_resource" "kubeconfig" {

  provisioner "local-exec" {
    command = <<LOCAL_EXEC
echo "${ var.ca }" > "${ var.data_dir}/ca.pem"
echo "${ var.client }" > "${ var.data_dir }/client.pem"
echo "${ var.client_key }" > "${ var.data_dir }/client_key.pem"
LOCAL_EXEC
  }


  provisioner "local-exec" {
    command = <<LOCAL_EXEC
export KUBECONFIG="${ var.data_dir}/kubeconfig"
kubectl config set-cluster cluster-${ var.name } \
  --embed-certs \
  --server=https://${ var.endpoint } \
  --certificate-authority=${ var.data_dir}/ca.pem &&\
kubectl config set-credentials admin-${ var.name } \
  --embed-certs \
  --certificate-authority=${ var.data_dir }/ca.pem \
  --client-key=${ var.data_dir }/client_key.pem \
  --client-certificate=${ var.data_dir }/client.pem &&\
kubectl config set-context ${ var.name } \
  --cluster=cluster-${ var.name } \
  --user=admin-${ var.name } &&\
kubectl config use-context ${ var.name }
LOCAL_EXEC
  }

}

data "template_file" "kubeconfig" {
  template = <<EOF
    kubectl config set-cluster cluster-${ var.name } \
    --embed-certs \
    --server=https://${ var.endpoint } \
    --certificate-authority=${ var.data_dir}/ca.pem

    kubectl config set-credentials admin-${ var.name } \
    --embed-certs \
    --certificate-authority=${ var.data_dir }/ca.pem \
    --client-key=${ var.data_dir }/client_key.pem \
    --client-certificate=${ var.data_dir }/client.pem

    kubectl config set-context ${ var.name } \
    --cluster=cluster-${ var.name } \
    --user=admin-${ var.name }

    kubectl config use-context ${ var.name }
    EOF
}
