<?php

namespace App\Form;

use App\Entity\Membre;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class MembreType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('email')
            ->add('roles', ChoiceType::class, ['choices' =>
                    [
                        'membre' => 'ROLE_USER',
                        'administrateur' => 'ROLE_ADMIN',
                        
                    ],
                    'required'  => true,
                    'multiple' => true,
                    "label" => "Rôles"
                ])
            ->add('password', PasswordType::class, [ "required" => false, "mapped" => false ])
            ->add('pseudo')
            ->add('nom')
            ->add('prenom')
            ->add('civilite')
            ->add('telephone')
            ->add('date_enregistrement')
           
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Membre::class,
        ]);
    }
}
