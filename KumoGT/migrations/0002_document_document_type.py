# Generated by Django 2.1.11 on 2019-10-23 18:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('KumoGT', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='document',
            name='document_type',
            field=models.CharField(blank=True, max_length=255),
        ),
    ]
