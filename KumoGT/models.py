from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
from .crypt_fields import EncryptedFileField
from django.dispatch import receiver
from .sel_options import GENDER, ETHNICITY_TYPE, US_RESIDENCY_TYPE,\
    TEXAS_RESIDENCY_TYPE, CITIZENSHIP, STUDENT_STATUS_TYPE, SEMESTER_TYPE,\
    YES_NO_TYPE, DEGREE_TYPE, MAJOR_TYPE,\
    DEGREE_PLAN_DOC_TYPE, PRE_EXAM_DOC_TYPE, EXAM_RESULT_TYPE,\
    T_D_DOC_TYPE, T_D_PROP_DOC_TYPE, FIN_EXAM_DOC_TYPE, QUAL_EXAM_DOC_TYPE,\
    ANNUAL_REVIEW_DOC_TYPE, ANNUAL_REVIEW_STATUS_TYPE


import os
from gdstorage.storage import GoogleDriveStorage


# Define Google Drive Storage
gd_storage = GoogleDriveStorage()


class Student(models.Model):
    uin = models.CharField(max_length=63, blank=False, unique=True, verbose_name='UIN')
    first_name = models.CharField(max_length=127, blank=False, verbose_name='First Name')
    middle_name = models.CharField(max_length=127, blank=True, verbose_name='Middle Name')
    last_name = models.CharField(max_length=127, blank=False, verbose_name='Last Name')
    email = models.EmailField(blank=False, unique=True, verbose_name='Email')
    gender = models.CharField(max_length=63, choices=GENDER,
                              default='not_ans', verbose_name='Gender')
    ethnicity = models.CharField(max_length=63, choices=ETHNICITY_TYPE,
                                 default='unknown', verbose_name='Ethnicity')
    us_residency = models.CharField(
        max_length=63, choices=US_RESIDENCY_TYPE, default='u', verbose_name='US Residency')
    texas_residency = models.CharField(
        max_length=63, choices=TEXAS_RESIDENCY_TYPE, default='s', verbose_name='Texas Residency')
    citizenship = models.CharField(max_length=127, choices=CITIZENSHIP, verbose_name='Citizenship')
    status = models.CharField(max_length=63, choices=STUDENT_STATUS_TYPE,
                              default='current', verbose_name='Status')
    start_year = models.SmallIntegerField(blank=False, default=0, verbose_name='Start Year',
                                          validators=[MaxValueValidator(32767), MinValueValidator(-32768)])
    start_sem = models.CharField(max_length=31, choices=SEMESTER_TYPE,
                                 default='fall', verbose_name='Start Semester')
    cur_degree = models.OneToOneField('Degree', models.SET_NULL,
                                      verbose_name='Current Degree', null=True)
    advisor = models.CharField(max_length=511, blank=True, verbose_name='Advisor')
    upe = models.CharField(max_length=15, default='no', choices=YES_NO_TYPE, verbose_name='UPE')
    ace = models.CharField(max_length=15, default='no', choices=YES_NO_TYPE, verbose_name='ACE')
    iga = models.CharField(max_length=15, default='no', choices=YES_NO_TYPE, verbose_name='IGA')
    propos_date = models.CharField(max_length=30, blank=False,
                                   null=True, verbose_name='Proposal Date')

    class Meta:
        verbose_name = 'Student'


class Degree(models.Model):
    deg_type = models.CharField(max_length=63, choices=DEGREE_TYPE,
                                default='none', verbose_name='Degree')
    major = models.CharField(max_length=63, choices=MAJOR_TYPE, verbose_name='Major')
    first_reg_year = models.SmallIntegerField(blank=False, default=0, verbose_name='First Registered Year',
                                              validators=[MaxValueValidator(32767), MinValueValidator(-32768)])
    first_reg_sem = models.CharField(max_length=31, choices=SEMESTER_TYPE,
                                     default='fall', verbose_name='First Registered Semester')
    last_reg_year = models.SmallIntegerField(blank=False, default=0, verbose_name='Last Registered Year',
                                             validators=[MaxValueValidator(32767), MinValueValidator(-32768)])
    last_reg_sem = models.CharField(max_length=31, choices=SEMESTER_TYPE,
                                    default='fall', verbose_name='Last Registered Semester')
    deg_recv_year = models.SmallIntegerField(blank=False, default=0, verbose_name='Degree Received Year',
                                             validators=[MaxValueValidator(32767), MinValueValidator(-32768)])
    deg_recv_sem = models.CharField(max_length=31, choices=SEMESTER_TYPE,
                                    default='fall', verbose_name='Degree Received Semester')
    stu = models.ForeignKey(Student, related_name='degrees',
                            on_delete=models.CASCADE, verbose_name='Student')
    note = models.TextField(blank=True,
                            verbose_name='Degree Note')

    class Meta:
        verbose_name = 'Degree' 


class Document(models.Model):
    doc = models.FileField(upload_to='documents/', storage=gd_storage, verbose_name='Document')
    uploaded_at = models.DateTimeField(auto_now_add=True, verbose_name='Uploaded at')
    notes = models.CharField(max_length=511, blank=True, verbose_name='Notes')
    deg_type = models.CharField(max_length=63, choices=DEGREE_TYPE,
                                default='none', verbose_name='Degree')
    class Meta:
        abstract = True


class Deg_Plan_Doc(Document):
    doc_type = models.CharField(max_length=255, choices=DEGREE_PLAN_DOC_TYPE,
                                default='not_sel', verbose_name='Document Type')
    stu = models.ForeignKey(Student, related_name='deg_plan_docs',
                            on_delete=models.CASCADE, verbose_name='Student')
    
    # def delete(self, *args, **kwargs):
    #     self.doc.delete()
    #     super().delete(*args, **kwargs)


    class Meta:
        verbose_name = 'Degree Plan'


class Pre_Exam_Doc(Document):
    doc_type = models.CharField(max_length=255, choices=PRE_EXAM_DOC_TYPE,
                                default='not_sel', verbose_name='Document Type')

    class Meta:
        verbose_name = 'Preliminary Exam Document'


class Pre_Exam_Info(models.Model):
    date = models.DateField(verbose_name='Date')
    result = models.CharField(max_length=15, choices=EXAM_RESULT_TYPE,
                              default='none', verbose_name='Result')
    degree = models.OneToOneField(Degree, models.CASCADE, verbose_name='Degree')

    class Meta:
        verbose_name = 'Preliminary Exam'


class Qual_Exam_Doc(Document):
    doc_type = models.CharField(max_length=255, choices=QUAL_EXAM_DOC_TYPE,
                                default='not_sel', verbose_name='Document Type')
    year = models.SmallIntegerField(blank=False, default=0, verbose_name='Year',
                                    validators=[MaxValueValidator(32767), MinValueValidator(-32768)])
    sem = models.CharField(max_length=31, choices=SEMESTER_TYPE,
                           default='fall', verbose_name='Semester')
    result = models.CharField(max_length=15, choices=EXAM_RESULT_TYPE,
                              default='none', verbose_name='Result')

    class Meta:
        verbose_name = 'Qualifying Exam'


class Annual_Review_Doc(Document):
    doc_type = models.CharField(max_length=255, choices=ANNUAL_REVIEW_DOC_TYPE,
                                default='not_sel', verbose_name='Document Type')
    year = models.SmallIntegerField(blank=False, default=0, verbose_name='Year',
                                    validators=[MaxValueValidator(32767), MinValueValidator(-32768)])
    status = models.CharField(max_length=15, choices=ANNUAL_REVIEW_STATUS_TYPE,
                              default='none', verbose_name='Status')

    class Meta:
        verbose_name = 'Annual Review'


class T_D_Prop_Doc(Document):  # Thesis/Dissertation Proposal Document
    doc_type = models.CharField(max_length=255, choices=T_D_PROP_DOC_TYPE,
                                default='not_sel', verbose_name='Document Type')

    class Meta:
        verbose_name = 'Thesis/Dissertation Proposal Document'


class T_D_Doc(Document):  # Thesis/Dissertation Document
    doc_type = models.CharField(max_length=255, choices=T_D_DOC_TYPE,
                                default='not_sel', verbose_name='Document Type')

    class Meta:
        verbose_name = 'Thesis/Dissertation Document'


class T_D_Info(models.Model):
    title = models.CharField(max_length=255, blank=True, verbose_name='Title')
    url = models.URLField(verbose_name='URL')
    degree = models.OneToOneField(Degree, models.CASCADE, verbose_name='Degree')

    class Meta:
        verbose_name = 'Thesis/Dissertation'


class Fin_Exam_Doc(Document):
    doc_type = models.CharField(max_length=255, choices=FIN_EXAM_DOC_TYPE,
                                default='not_sel', verbose_name='Document Type')

    class Meta:
        verbose_name = 'Final Exam Document'


class Fin_Exam_Info(models.Model):
    date = models.DateField(verbose_name='Date')
    time = models.TimeField(verbose_name='Time')
    result = models.CharField(max_length=15, choices=EXAM_RESULT_TYPE,
                              default='none', verbose_name='Result')
    title = models.CharField(max_length=255, blank=True, verbose_name='Title')
    room = models.CharField(max_length=255, blank=True, verbose_name='Room')
    abstract = models.CharField(max_length=1023, blank=True, verbose_name='Abstract')
    degree = models.OneToOneField(Degree, models.CASCADE, verbose_name='Degree')

    class Meta:
        verbose_name = 'Final Exam'


class Other_Doc(Document):
    doc_type = models.CharField(max_length=255, verbose_name='Document Type')

    class Meta:
        verbose_name = 'Other Document'


class Session_Note(models.Model):
    date = models.DateField(verbose_name='Date')
    note = models.CharField(max_length=4096, blank=True, verbose_name='Note')
    stu = models.ForeignKey(Student, models.CASCADE, verbose_name='Student')

    class Meta:
        verbose_name = 'Session Note'


# @receiver(models.signals.post_delete, sender=Deg_Plan_Doc)
@receiver(models.signals.post_delete, sender=Pre_Exam_Doc)
@receiver(models.signals.post_delete, sender=T_D_Prop_Doc)
@receiver(models.signals.post_delete, sender=T_D_Doc)
@receiver(models.signals.post_delete, sender=Fin_Exam_Doc)
@receiver(models.signals.post_delete, sender=Other_Doc)
@receiver(models.signals.post_delete, sender=Qual_Exam_Doc)
@receiver(models.signals.post_delete, sender=Annual_Review_Doc)
def auto_delete_file_on_delete(sender, instance, **kwargs):
    """
    Deletes file from filesystem
    when corresponding `Document` object is deleted.
    """
    if instance.doc:
        if os.path.isfile(instance.doc.path):
            os.remove(instance.doc.path)


@receiver(models.signals.pre_save, sender=Deg_Plan_Doc)
@receiver(models.signals.pre_save, sender=Pre_Exam_Doc)
@receiver(models.signals.pre_save, sender=T_D_Prop_Doc)
@receiver(models.signals.pre_save, sender=T_D_Doc)
@receiver(models.signals.pre_save, sender=Fin_Exam_Doc)
@receiver(models.signals.pre_save, sender=Other_Doc)
@receiver(models.signals.pre_save, sender=Qual_Exam_Doc)
@receiver(models.signals.pre_save, sender=Annual_Review_Doc)
def auto_delete_file_on_change(sender, instance, **kwargs):
    """
    Deletes old file from filesystem
    when corresponding `Document` object is updated
    with new file.
    """
    if not instance.id:
        return False

    try:
        old_file = sender.objects.get(id=instance.id).doc
    except Document.DoesNotExist:
        return False

    new_file = instance.doc
    if not old_file == new_file:
        if os.path.isfile(old_file.path):
            os.remove(old_file.path)
