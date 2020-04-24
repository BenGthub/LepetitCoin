<?php

namespace App\Form;

use App\Entity\Annonce;
use App\Entity\Categorie;
use App\Entity\Membre;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Validator\Constraints\File;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Validator\Constraints\Length;

class AnnonceType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('titre',TextType::class, [ "constraints" => 
                                                    [ new Length([ "max" => 50,
                                                                   "maxMessage" => "Le texte ne peut pas dépasser 22 caractères"
                                                                 ]) 
                                                    ] 
                                                 ])
            ->add('description_courte',TextType::class, [ "constraints" => 
                                                    [ new Length([ "max" => 245,
                                                                   "maxMessage" => "Le texte ne peut pas dépasser 25 caractères"
                                                                 ]) 
                                                    ] 
                                                 ])
            ->add('description_longue', TextType::class, [ "constraints" => 
                                                    [ new Length([ "max" => 800,
                                                                   "maxMessage" => "Le nom de l'auteur ne peut pas dépasser 225 caractères"
                                                                 ]) 
                                                    ] 
                                                 ])
            ->add('prix')
            ->add('adresse')
            ->add('ville')
            ->add('cp')
            ->add('pays')
            ->add('date_enregistrement', DateType::class,[ "widget" => "single_text" ])
            ->add('photo1', FileType::class, [ "mapped" => false, "required" => false,
                    "constraints" => [ new File([ "mimeTypes" => [ "image/gif", "image/jpeg", "image/png", "image/jpg"],
                                                    "mimeTypesMessage" => "Les formats autorisés sont gig, jpeg, png",
                                                    "maxSize" => "2048k",
                                                    "maxSizeMessage" => "Le fichier ne peut pas faire plus de 2Mo"
                                                ])]
                ])
            ->add('photo2', FileType::class, [ "mapped" => false, "required" => false,
                    "constraints" => [ new File([ "mimeTypes" => [ "image/gif", "image/jpeg", "image/png", "image/jpg" ],
                                                    "mimeTypesMessage" => "Les formats autorisés sont gig, jpeg, png",
                                                    "maxSize" => "2048k",
                                                    "maxSizeMessage" => "Le fichier ne peut pas faire plus de 2Mo"
                                                ])]
                ])
            ->add('photo3', FileType::class, [ "mapped" => false, "required" => false,
                    "constraints" => [ new File([ "mimeTypes" => [ "image/gif", "image/jpeg", "image/png", "image/jpg" ],
                                                    "mimeTypesMessage" => "Les formats autorisés sont gig, jpeg, png",
                                                    "maxSize" => "2048k",
                                                    "maxSizeMessage" => "Le fichier ne peut pas faire plus de 2Mo"
                                                ])]
                ])   
            ->add('photo4', FileType::class, [ "mapped" => false, "required" => false,
                    "constraints" => [ new File([ "mimeTypes" => [ "image/gif", "image/jpeg", "image/png", "image/jpg" ],
                                                    "mimeTypesMessage" => "Les formats autorisés sont gig, jpeg, png",
                                                    "maxSize" => "2048k",
                                                    "maxSizeMessage" => "Le fichier ne peut pas faire plus de 2Mo"
                                                ])]
                ])   
            ->add('photo5', FileType::class, [ "mapped" => false, "required" => false,
                    "constraints" => [ new File([ "mimeTypes" => [ "image/gif", "image/jpeg", "image/png", "image/jpg" ],
                                                    "mimeTypesMessage" => "Les formats autorisés sont gig, jpeg, png",
                                                    "maxSize" => "2048k",
                                                    "maxSizeMessage" => "Le fichier ne peut pas faire plus de 2Mo"
                                                ])]
                ])   
            ->add('categorie',EntityType::class, [ "class" => Categorie::class, "choice_label" => "titre" ])
            ->add('membre',EntityType::class, [ "class" => Membre::class, "choice_label" => "email" ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Annonce::class,
        ]);
    }
}
