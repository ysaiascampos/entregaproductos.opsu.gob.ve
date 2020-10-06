<?php

namespace S\VentasBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class EventosType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nombre')
            ->add('descripcion')
            ->add('tipoPago' , 'choice' , array (
            'choices' => array ('0' => 'Prepago', '1' => 'Pospago')
                ,'expanded'=>'1'
                    ))
            ->add('estatus' , 'choice' , array (
            'choices' => array ('1' => 'Activo', '0' => 'Inactivo')
                ,'expanded'=>'1'
                    ))
            ->add('fecha' , null, array('label' => 'Fecha de Evento: ','widget' => 'single_text','format' => 'dd-MM-yyyy', 'attr' => array('class' => 'form-control')))
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'S\VentasBundle\Entity\Eventos'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 's_ventasbundle_eventos';
    }
}
