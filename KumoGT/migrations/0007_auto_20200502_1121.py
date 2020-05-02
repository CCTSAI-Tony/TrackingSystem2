# -*- coding: utf-8 -*-
# Generated by Django 1.11.10 on 2020-05-02 16:21
from __future__ import unicode_literals

from django.db import migrations, models
import gdstorage.storage


class Migration(migrations.Migration):

    dependencies = [
        ('KumoGT', '0006_deg_plan_doc_stu'),
    ]

    operations = [
        migrations.AlterField(
            model_name='annual_review_doc',
            name='doc',
            field=models.FileField(storage=gdstorage.storage.GoogleDriveStorage(), upload_to=b'documents/', verbose_name=b'Document'),
        ),
        migrations.AlterField(
            model_name='deg_plan_doc',
            name='doc',
            field=models.FileField(storage=gdstorage.storage.GoogleDriveStorage(), upload_to=b'documents/', verbose_name=b'Document'),
        ),
        migrations.AlterField(
            model_name='fin_exam_doc',
            name='doc',
            field=models.FileField(storage=gdstorage.storage.GoogleDriveStorage(), upload_to=b'documents/', verbose_name=b'Document'),
        ),
        migrations.AlterField(
            model_name='other_doc',
            name='doc',
            field=models.FileField(storage=gdstorage.storage.GoogleDriveStorage(), upload_to=b'documents/', verbose_name=b'Document'),
        ),
        migrations.AlterField(
            model_name='pre_exam_doc',
            name='doc',
            field=models.FileField(storage=gdstorage.storage.GoogleDriveStorage(), upload_to=b'documents/', verbose_name=b'Document'),
        ),
        migrations.AlterField(
            model_name='qual_exam_doc',
            name='doc',
            field=models.FileField(storage=gdstorage.storage.GoogleDriveStorage(), upload_to=b'documents/', verbose_name=b'Document'),
        ),
        migrations.AlterField(
            model_name='t_d_doc',
            name='doc',
            field=models.FileField(storage=gdstorage.storage.GoogleDriveStorage(), upload_to=b'documents/', verbose_name=b'Document'),
        ),
        migrations.AlterField(
            model_name='t_d_prop_doc',
            name='doc',
            field=models.FileField(storage=gdstorage.storage.GoogleDriveStorage(), upload_to=b'documents/', verbose_name=b'Document'),
        ),
    ]
