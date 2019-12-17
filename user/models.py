# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Answer(models.Model):
    a_id = models.IntegerField(primary_key=True)
    a_answer = models.CharField(max_length=255)
    q = models.ForeignKey('Question', models.DO_NOTHING)
    c = models.ForeignKey('Crawl', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'answer'


class Crawl(models.Model):
    c_id = models.AutoField(primary_key=True)
    c_pname = models.CharField(db_column='c_pName', max_length=255)  # Field name made lowercase.
    k = models.ForeignKey('Keyword', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'crawl'


class Keyword(models.Model):
    k_id = models.AutoField(primary_key=True)
    k_keyword = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'keyword'


class Question(models.Model):
    q_id = models.AutoField(primary_key=True)
    q_name = models.CharField(max_length=255)
    k = models.ForeignKey(Keyword, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'question'


class User(models.Model):
    u_id = models.AutoField(primary_key=True)
    u_name = models.CharField(max_length=255)
    u_password = models.CharField(max_length=255)
    u_email = models.CharField(max_length=255)
    u_phone = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'user'
