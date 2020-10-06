<?php

namespace S\VentasBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class UserEventoType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('idUser', null, array(
                'label' => 'Usuario ','empty_value' => 'Seleccione',  "required"=> true))
            ->add('idEvento', null, array(
                'label' => 'Evento ','empty_value' => 'Seleccione',  "required"=> true))
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'S\VentasBundle\Entity\UserEvento'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 's_ventasbundle_userevento';
    }
}
