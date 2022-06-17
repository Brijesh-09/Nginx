#!/bin/bash


DEPL_DIR='C:\Users\brijesh\OneDrive\Desktop\Assignment'
DEPL_DIR='C:\Users\brijesh\OneDrive\Desktop\Assignment'
SVC_DIR='C:\Users\brijesh\OneDrive\Desktop\Assignment'


kubectl apply  -f "$DEPL_DIR/blueapp.yaml"
kubectl apply  -f "$DEPL_DIR/greenapp.yaml"
kubectl apply  -f "$SVC_DIR/ingress.yaml"
kubectl get all 