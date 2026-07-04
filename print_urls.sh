#!/bin/bash

echo "=========================================================="
echo "          MICROSERVICES CODE ENGINE URLS                  "
echo "=========================================================="
echo ""

# Query URLs
PROD_URL=$(ibmcloud ce application get --name prodlist --output url 2>/dev/null || ibmcloud ce app get -n prodlist 2>/dev/null | grep -i "URL:" | awk '{print $2}')
DEALER_URL=$(ibmcloud ce application get --name dealerdetails --output url 2>/dev/null || ibmcloud ce app get -n dealerdetails 2>/dev/null | grep -i "URL:" | awk '{print $2}')
FRONTEND_URL=$(ibmcloud ce application get --name frontend --output url 2>/dev/null || ibmcloud ce app get -n frontend 2>/dev/null | grep -i "URL:" | awk '{print $2}')

if [ -z "$PROD_URL" ]; then
  echo "Product Details Backend: NOT DEPLOYED (or check your connection)"
else
  echo "Product Details Backend:  $PROD_URL"
fi

if [ -z "$DEALER_URL" ]; then
  echo "Dealer Pricing Backend:   NOT DEPLOYED (or check your connection)"
else
  echo "Dealer Pricing Backend:   $DEALER_URL"
fi

if [ -z "$FRONTEND_URL" ]; then
  echo "Frontend App:             NOT DEPLOYED (or check your connection)"
else
  echo "Frontend App:             $FRONTEND_URL"
fi
echo ""
echo "=========================================================="
