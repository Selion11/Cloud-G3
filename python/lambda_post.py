import json
import boto3
import re
from datetime import datetime

def date_check(date):
    # Define the regex pattern for a date in dd/mm/yyyy format
    pattern = re.compile(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$')
    
    # Use fullmatch to ensure the entire string matches the pattern
    if not pattern.fullmatch(date):
        return False
    
    # Further validate the date using datetime.strptime
    try:
        datetime.strptime(date, "%d/%m/%Y")
        return True
    except ValueError:
        return False


dynamodb = boto3.resource('dynamodb')

table = dynamodb.Table('Tabla_Vacunas')

vacuna_types = ['Covid-19', 'Influenza', 'Hepatitis', 'Sarampion', 'Rabia', 
                'Tetanos', 'Varicela', 'Neumococo', 'Rotavirus', 'Meningococo', 
                'Papiloma', 'Hepatitis B', 'Fiebre Amarilla', 'Difteria', 'Tosferina', 
                'Polio', 'Haemophilus', 'BCG', 'Triple Viral', 'Pentavalente', 'Hepatitis A']

def lambda_handler(event, context):
    Vacuna_ID = event['Vacuna_ID']
    name = event['name']
    Fecha = event['Fecha']
    
    if not Vacuna_ID or not name or not Fecha:
        return {
            'statusCode': 400,
            'body': json.dumps('Vacuna_ID, name and Fecha are required')
        }

    if len(Vacuna_ID) != 12 or not Vacuna_ID.isnumeric():
        return {
            'statusCode': 400,
            'body': json.dumps('Vacuna_ID invalido')
        }

    if name not in vacuna_types:
        return {
            'statusCode': 400,
            'body': json.dumps('Tipo de vacuna invalido')
        }
        
    if not date_check(Fecha):
        return {
            'statusCode': 400,
            'body': json.dumps('Fecha invalida')
        }
    
    response = table.put_item(
        Item={
            'Vacuna_ID': Vacuna_ID,
            'name': name,
            'Fecha': Fecha,
        }
    )
    
    
    return {
        'statusCode': 200,
        'body': json.dumps('Vacuna data saved successfully!')
    }
