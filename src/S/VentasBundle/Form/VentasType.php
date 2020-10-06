<?php

namespace S\VentasBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;


use Doctrine\ORM\EntityRepository;
use S\VentasBundle\Entity\Personas;
use S\VentasBundle\Entity\Eventos;

class VentasType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            //->add('idPersonal', null, array('label' => 'Personal ','empty_value' => 'Seleccione',  "required"=> true))
            ->add('idPersonal', 'entity', array(
                'label' => 'Personal ','empty_value' => 'Seleccione',  "required"=> true,
                'class' => 'S\VentasBundle\Entity\Personas',
                'query_builder' => function(EntityRepository $er ){
                    return $er->createQueryBuilder('w')
                  ->orderBy('w.cedula', 'ASC')
                  ->where('w.estatus = 1');
              }))
            //->add('idEventos', null, array('label' => 'Evento ','empty_value' => 'Seleccione',  "required"=> true))
            ->add('idEventos', 'entity', array(
                'label' => 'Evento ','empty_value' => 'Seleccione',  "required"=> true,
                'class' => 'S\VentasBundle\Entity\Eventos',
                'query_builder' => function(EntityRepository $er ){
                    return $er->createQueryBuilder('w')
                  ->orderBy('w.id', 'ASC')
                  ->where('w.estatus = 1');
              }));

    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'S\VentasBundle\Entity\Ventas'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 's_ventasbundle_ventas';
    }
}
