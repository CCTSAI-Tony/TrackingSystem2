from django import forms
from django.utils import timezone
from .models import Student, Degree, Pre_Exam_Info, Fin_Exam_Info, T_D_Info,\
    Session_Note
from .sel_options import STUDENT_STATUS_TYPE, GENDER, ETHNICITY_TYPE,\
    US_RESIDENCY_TYPE, TEXAS_RESIDENCY_TYPE, CITIZENSHIP,\
    SEMESTER_TYPE, DEGREE_TYPE, MAJOR_TYPE, YES_NO_TYPE


class stu_search_form(forms.Form):
    uin = forms.CharField(label='UIN', max_length=63, required=False,
                          widget=forms.TextInput(attrs={'class': 'w3-input w3-cell', 'style': 'width:auto'}))
    first_name = forms.CharField(label='First Name', max_length=127, required=False,
                                 widget=forms.TextInput(attrs={'class': 'w3-input w3-cell', 'style': 'width:auto'}))
    last_name = forms.CharField(label='Last Name', max_length=127, required=False,
                                widget=forms.TextInput(attrs={'class': 'w3-input w3-cell', 'style': 'width:auto'}))
    gender = forms.ChoiceField(choices=[('', 'All')] + GENDER, required=False,
                               widget=forms.Select(attrs={'class': 'w3-select', 'style': 'width:auto'}))
    ethnicity = forms.ChoiceField(choices=[('', 'All')] + ETHNICITY_TYPE, required=False,
                                  widget=forms.Select(attrs={'class': 'w3-select', 'style': 'width:auto'}))
    us_residency = forms.ChoiceField(choices=[('', 'All')] + US_RESIDENCY_TYPE, required=False,
                                     widget=forms.Select(attrs={'class': 'w3-select', 'style': 'width:72%'}))
    texas_residency = forms.ChoiceField(choices=[('', 'All')] + TEXAS_RESIDENCY_TYPE, required=False,
                                        widget=forms.Select(attrs={'class': 'w3-select', 'style': 'width:70%'}))
    citizenship = forms.ChoiceField(choices=[('', 'All')] + CITIZENSHIP, required=False,
                                    widget=forms.Select(attrs={'class': 'w3-select', 'style': 'width:80%'}))
    status = forms.ChoiceField(choices=[('', 'All')] + STUDENT_STATUS_TYPE, required=False,
                               widget=forms.Select(attrs={'class': 'w3-select', 'style': 'width:auto'}))
    start_year = forms.IntegerField(max_value=32767, min_value=-32768, required=False,
                                    widget=forms.NumberInput(attrs={'class': 'w3-input w3-cell w3-center', 'style': 'width:auto'}))
    start_sem = forms.ChoiceField(choices=[('', 'All')] + SEMESTER_TYPE, required=False,
                                  widget=forms.Select(attrs={'class': 'w3-select', 'style': 'width:auto'}))
    cur_degree = forms.ChoiceField(choices=[('', 'All')] + DEGREE_TYPE + [('none', 'None')], required=False,
                                   widget=forms.Select(attrs={'class': 'w3-select', 'style': 'width:auto'}))
    cur_degree__major = forms.ChoiceField(choices=[('', 'All')] + MAJOR_TYPE, required=False,
                                          widget=forms.Select(attrs={'class': 'w3-select', 'style': 'width:auto'}))
    advisor = forms.CharField(label='Advisor', max_length=511, required=False,
                              widget=forms.TextInput(attrs={'class': 'w3-input w3-cell', 'style': 'width:auto'}))
    upe = forms.ChoiceField(choices=[('', 'All')] + YES_NO_TYPE, required=False,
                            widget=forms.Select(attrs={'class': 'w3-select', 'style': 'width:auto'}))
    ace = forms.ChoiceField(choices=[('', 'All')] + YES_NO_TYPE, required=False,
                            widget=forms.Select(attrs={'class': 'w3-select', 'style': 'width:auto'}))
    iga = forms.ChoiceField(choices=[('', 'All')] + YES_NO_TYPE, required=False,
                            widget=forms.Select(attrs={'class': 'w3-select', 'style': 'width:auto'}))


class stu_bio_form(forms.ModelForm):
    class Meta:
        model = Student
        exclude = ['cur_degree']
        widgets = {
            'uin': forms.TextInput(attrs={'class': 'w3-input'}),
            'first_name': forms.TextInput(attrs={'class': 'w3-input'}),
            'middle_name': forms.TextInput(attrs={'class': 'w3-input'}),
            'last_name': forms.TextInput(attrs={'class': 'w3-input'}),
            'email': forms.EmailInput(attrs={'class': 'w3-input'}),
            'gender': forms.Select(attrs={'class': 'w3-select'}),
            'ethnicity': forms.Select(attrs={'class': 'w3-select'}),
            'us_residency': forms.Select(attrs={'class': 'w3-select'}),
            'texas_residency': forms.Select(attrs={'class': 'w3-select'}),
            'citizenship': forms.Select(attrs={'class': 'w3-select'}),
            'status': forms.Select(attrs={'class': 'w3-select'}),
            'start_year': forms.NumberInput(attrs={'class': 'w3-input'}),
            'start_sem': forms.Select(attrs={'class': 'w3-select'}),
            'advisor': forms.TextInput(attrs={'class': 'w3-input'}),
            'upe': forms.Select(attrs={'class': 'w3-select'}),
            'ace': forms.Select(attrs={'class': 'w3-select'}),
            'iga': forms.Select(attrs={'class': 'w3-select'}),
        }


class deg_form(forms.ModelForm):
    class Meta:
        model = Degree
        exclude = ['stu']
        widgets = {
            'deg_type': forms.Select(attrs={'class': 'w3-select w3-cell', 'style': 'width: auto;'}),
            'major': forms.Select(attrs={'class': 'w3-select w3-cell', 'style': 'width: auto;'}),
            'first_reg_year': forms.NumberInput(attrs={'class': 'w3-input w3-cell', 'style': 'width:45%'}),
            'first_reg_sem': forms.Select(attrs={'class': 'w3-select w3-cell', 'style': 'width:52%'}),
            'last_reg_year': forms.NumberInput(attrs={'class': 'w3-input w3-cell', 'style': 'width:45%'}),
            'last_reg_sem': forms.Select(attrs={'class': 'w3-select w3-cell', 'style': 'width:52%'}),
            'deg_recv_year': forms.NumberInput(attrs={'class': 'w3-input w3-cell', 'style': 'width:45%'}),
            'deg_recv_sem': forms.Select(attrs={'class': 'w3-select w3-cell', 'style': 'width:52%'}),
        }


def create_doc_form(model_in, type_widget=0, extra_fields=[]):
    '''Generate Model Form for docs dynamically
        type_widget: 0 for select, others for input
        extra_field: [(name, widget)]
    '''
    class Meta:
        model = model_in        # model input
        fields = ['deg_type', 'doc_type', 'doc', 'notes']
        widgets = {
            'deg_type': forms.Select(attrs={'class': 'w3-select w3-cell', 'style': 'width: auto;'}),
            'doc_type': forms.Select(attrs={'class': 'w3-select'})
            if type_widget == 0 else
            forms.TextInput(attrs={'class': 'w3-input'}),
            'notes': forms.Textarea(attrs={'cols': 15, 'rows': 5}),
        }

    for field in extra_fields:
        Meta.fields.append(field[0])
        Meta.widgets[field[0]] = field[1]

    attrs = {'Meta': Meta}

    _model_form_class = type("DynamicModelForm", (forms.ModelForm,), attrs)
    # Parameters: object name, tuple(input father), dict of meta

    return _model_form_class    # return a class


class pre_exam_info_form(forms.ModelForm):
    class Meta:
        model = Pre_Exam_Info
        fields = ['date', 'result']
        widgets = {
            'date': forms.SelectDateWidget
            (attrs={'class': 'w3-select', 'style': 'width:auto'},
             years=[y for y in range(timezone.now().year - 7, timezone.now().year + 8)]),
            'result': forms.Select(attrs={'class': 'w3-select', 'style': 'width:auto;'})
        }


class final_exam_info_form(forms.ModelForm):
    class Meta:
        model = Fin_Exam_Info
        fields = ['date', 'time', 'result', 'title', 'room', 'abstract']
        widgets = {
            'date': forms.SelectDateWidget
            (attrs={'class': 'w3-select', 'style': 'width:auto'},
             years=[y for y in range(timezone.now().year - 7, timezone.now().year + 8)]),
            'result': forms.Select(attrs={'class': 'w3-select', 'style': 'width:auto;'}),
            'abstract': forms.Textarea(attrs={'cols': 50, 'rows': 5, 'style': "width:80%"}),
            'room': forms.Textarea(attrs={'cols': 50, 'rows': 1, 'style': "width:80%"}),
            'time': forms.TimeInput(attrs={'style': "width:80%"}),
            'title': forms.Textarea(attrs={'cols': 50, 'rows': 1, 'style': "width:80%"}),
        }


class thesis_dissertation_info_form(forms.ModelForm):
    class Meta:
        model = T_D_Info
        fields = ['title', 'url']
        widgets = {
            'title': forms.Textarea(attrs={'cols': 50, 'rows': 1, 'style': "width:80%"}),
            'url': forms.URLInput(attrs={'cols': 50, 'rows': 1, 'style': "width:80%"}),
        }


class session_note_form(forms.ModelForm):
    class Meta:
        model = Session_Note
        fields = ['date', 'note']
        widgets = {
            'date': forms.SelectDateWidget
            (attrs={'class': 'w3-select', 'style': 'width:auto'},
             years=[y for y in range(timezone.now().year - 7, timezone.now().year + 8)]),
            'note': forms.Textarea(attrs={'cols': 50, 'rows': 10, 'style': "width:80%"}),
        }


class degree_note_form(forms.ModelForm):
    class Meta():
        model = Degree
        fields = ['note']
        widgets = {
            'note': forms.Textarea(attrs={'cols': 50, 'rows': 10, 'style': "width:80%"}),
        }
